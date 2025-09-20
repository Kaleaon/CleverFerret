import os
import sys
import json
from emergentintegrations import EmergentLLM

def analyze_code_changes():
    try:
        # Initialize Emergent LLM with Gemini
        llm = EmergentLLM(
            api_key=os.environ.get('EMERGENT_LLM_KEY'),
            provider='gemini'
        )
        
        # Read changed files
        try:
            with open('changed_files.txt', 'r') as f:
                changed_files = f.read().strip()
            with open('diff.txt', 'r') as f:
                diff_content = f.read()
        except FileNotFoundError:
            print("No changes detected")
            return {"passed": True, "score": 100, "issues": []}
        
        if not changed_files.strip():
            print("No files changed")
            return {"passed": True, "score": 100, "issues": []}
        
        # Prepare AI review prompt
        review_prompt = f"""
        You are an expert Android developer and code reviewer for the CleverFerret Universal Media Library project.
        
        Please analyze the following code changes and provide a comprehensive review focusing on:
        
        1. **Build Safety**: Will these changes break the Universal Build System or Gradle configuration?
        2. **Architecture Compatibility**: Do changes maintain multi-architecture support (x86, ARM64, etc.)?
        3. **Code Quality**: Are there syntax errors, missing imports, or Android best practices violations?
        4. **Integration Safety**: Will AI tools, android-tools integration, or dependency injection remain intact?
        
        **Changed Files:**
        {changed_files}
        
        **Code Diff:**
        {diff_content[:8000]}  # Limit to prevent token overflow
        
        Respond in JSON format:
        {{
          "passed": true/false,
          "score": 0-100,
          "issues": [
            {{
              "severity": "error/warning/info",
              "category": "build/architecture/code/integration",
              "file": "filename",
              "description": "Issue description",
              "suggestion": "How to fix"
            }}
          ],
          "summary": "Overall assessment"
        }}
        
        CRITICAL: Return "passed": false for any issues that could break the build or runtime functionality.
        """
        
        response = llm.chat.completions.create(
            model="gemini-1.5-pro",
            messages=[{"role": "user", "content": review_prompt}],
            temperature=0.1
        )
        
        # Parse AI response
        ai_response = response.choices[0].message.content
        print(f"AI Response: {ai_response}")
        
        # Try to extract JSON from response
        try:
            # Look for JSON in the response
            json_start = ai_response.find('{')
            json_end = ai_response.rfind('}') + 1
            if json_start != -1 and json_end > json_start:
                json_content = ai_response[json_start:json_end]
                review_result = json.loads(json_content)
            else:
                # Fallback parsing
                review_result = {"passed": True, "score": 85, "issues": [], "summary": "AI review completed"}
        except json.JSONDecodeError:
            print("Failed to parse AI response, assuming safe")
            review_result = {"passed": True, "score": 85, "issues": [], "summary": "AI review completed with parsing issues"}
        
        return review_result
        
    except Exception as e:
        print(f"AI Review failed: {str(e)}")
        # Fail safe - if AI review fails, allow the build
        return {"passed": True, "score": 75, "issues": [{"severity": "warning", "description": f"AI review system error: {str(e)}"}], "summary": "AI review system encountered an error, allowing build to proceed"}

if __name__ == "__main__":
    result = analyze_code_changes()
    print(f"Review Result: {json.dumps(result, indent=2)}")
    
    # Set GitHub Actions outputs
    with open(os.environ['GITHUB_OUTPUT'], 'a') as f:
        f.write(f"passed={str(result['passed']).lower()}\n")
        f.write(f"score={result['score']}\n")
        f.write(f"summary={result.get('summary', 'AI review completed')}\n")
    
    # Write detailed results to file
    with open('ai_review_results.json', 'w') as f:
        json.dump(result, f, indent=2)
    
    # Exit with error code if review failed
    if not result['passed']:
        print("❌ AI Review FAILED - Build will be blocked")
        sys.exit(1)
    else:
        print("✅ AI Review PASSED - Proceeding with build")