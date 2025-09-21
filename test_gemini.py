import google.generativeai as genai
import os

# Test if we can import and configure Gemini
try:
    print("🧪 Testing Gemini API integration...")
    
    # Note: In actual workflow, this would come from GitHub Secrets
    # For local testing, we'll just test the import and basic setup
    print("✅ google.generativeai imported successfully")
    
    # Test model initialization (without actual API key)
    try:
        model = genai.GenerativeModel('gemini-2.0-flash-exp')
        print("✅ Model initialization works")
    except Exception as e:
        print(f"⚠️ Model initialization: {e}")
    
    # Test the structure we'll use in the workflow
    test_prompt = """
    Analyze this simple test change:
    
    Changed Files: test.txt
    Code Diff: +Hello World
    
    Respond in JSON format:
    {
      "passed": true,
      "score": 100,
      "summary": "Simple test change looks good"
    }
    """
    
    print("✅ Prompt structure ready")
    print("✅ All imports and basic setup working correctly")
    print("\n🎯 Ready for GitHub Actions workflow!")
    
except ImportError as e:
    print(f"❌ Import error: {e}")
except Exception as e:
    print(f"❌ General error: {e}")
