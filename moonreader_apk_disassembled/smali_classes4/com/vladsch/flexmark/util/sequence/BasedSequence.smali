.class public interface abstract Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.super Ljava/lang/Object;
.source "BasedSequence.java"

# interfaces
.implements Ljava/lang/CharSequence;
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vladsch/flexmark/util/sequence/BasedSequence$EmptyBasedSequence;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/CharSequence;",
        "Ljava/lang/Comparable<",
        "Ljava/lang/CharSequence;",
        ">;"
    }
.end annotation


# static fields
.field public static final EMPTY_ARRAY:[Lcom/vladsch/flexmark/util/sequence/BasedSequence;

.field public static final EMPTY_LIST:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/vladsch/flexmark/util/sequence/BasedSequence;",
            ">;"
        }
    .end annotation
.end field

.field public static final EMPTY_SEGMENTS:[Lcom/vladsch/flexmark/util/sequence/BasedSequence;

.field public static final EOL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

.field public static final EOL_CHAR:C

.field public static final EOL_CHAR1:C

.field public static final EOL_CHAR2:C

.field public static final EOL_CHARS:Ljava/lang/String; = "\r\n"

.field public static final NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

.field public static final SPACE:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

.field public static final SPLIT_INCLUDE_DELIMS:I = 0x1

.field public static final SPLIT_INCLUDE_DELIM_PARTS:I = 0x8

.field public static final SPLIT_SKIP_EMPTY:I = 0x4

.field public static final SPLIT_TRIM_PARTS:I = 0x2

.field public static final SPLIT_TRIM_SKIP_EMPTY:I = 0x6

.field public static final WHITESPACE_CHARS:Ljava/lang/String; = " \t\r\n"

.field public static final WHITESPACE_NBSP_CHARS:Ljava/lang/String; = " \t\r\n\u00a0"

.field public static final WHITESPACE_NO_EOL_CHARS:Ljava/lang/String; = " \t"


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 16
    new-instance v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence$EmptyBasedSequence;

    invoke-direct {v0}, Lcom/vladsch/flexmark/util/sequence/BasedSequence$EmptyBasedSequence;-><init>()V

    sput-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->NULL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 17
    const-string v0, "\n"

    invoke-static {v0}, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->of(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/CharSubSequence;

    move-result-object v0

    sput-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->EOL:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 18
    const-string v0, " "

    invoke-static {v0}, Lcom/vladsch/flexmark/util/sequence/CharSubSequence;->of(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/CharSubSequence;

    move-result-object v0

    sput-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->SPACE:Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 19
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->EMPTY_LIST:Ljava/util/List;

    const/4 v0, 0x0

    .line 20
    new-array v1, v0, [Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    sput-object v1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->EMPTY_ARRAY:[Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    .line 26
    const-string v1, "\r\n"

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    sput-char v3, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->EOL_CHAR:C

    .line 27
    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v3

    sput-char v3, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->EOL_CHAR1:C

    .line 28
    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    sput-char v1, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->EOL_CHAR2:C

    .line 29
    new-array v0, v0, [Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    sput-object v0, Lcom/vladsch/flexmark/util/sequence/BasedSequence;->EMPTY_SEGMENTS:[Lcom/vladsch/flexmark/util/sequence/BasedSequence;

    return-void
.end method


# virtual methods
.method public varargs abstract append([Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract appendTo(Ljava/lang/StringBuilder;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract appendTo(Ljava/lang/StringBuilder;I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract appendTo(Ljava/lang/StringBuilder;II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract baseSubSequence(I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract baseSubSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract containsAllOf(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Z
.end method

.method public abstract containsSomeOf(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Z
.end method

.method public abstract countChars(C)I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract countChars(CI)I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract countChars(CII)I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract countChars(Ljava/lang/CharSequence;)I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract countChars(Ljava/lang/CharSequence;I)I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract countChars(Ljava/lang/CharSequence;II)I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract countCharsReversed(C)I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract countCharsReversed(CI)I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract countCharsReversed(CII)I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract countCharsReversed(Ljava/lang/CharSequence;)I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract countCharsReversed(Ljava/lang/CharSequence;I)I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract countCharsReversed(Ljava/lang/CharSequence;II)I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract countLeading()I
.end method

.method public abstract countLeading(C)I
.end method

.method public abstract countLeading(CI)I
.end method

.method public abstract countLeading(CII)I
.end method

.method public abstract countLeading(Ljava/lang/CharSequence;)I
.end method

.method public abstract countLeading(Ljava/lang/CharSequence;I)I
.end method

.method public abstract countLeading(Ljava/lang/CharSequence;II)I
.end method

.method public abstract countLeadingColumns(ILjava/lang/CharSequence;)I
.end method

.method public abstract countLeadingNot()I
.end method

.method public abstract countLeadingNot(C)I
.end method

.method public abstract countLeadingNot(CI)I
.end method

.method public abstract countLeadingNot(CII)I
.end method

.method public abstract countLeadingNot(Ljava/lang/CharSequence;)I
.end method

.method public abstract countLeadingNot(Ljava/lang/CharSequence;I)I
.end method

.method public abstract countLeadingNot(Ljava/lang/CharSequence;II)I
.end method

.method public abstract countNotChars(C)I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract countNotChars(CI)I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract countNotChars(CII)I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract countNotChars(Ljava/lang/CharSequence;)I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract countNotChars(Ljava/lang/CharSequence;I)I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract countNotChars(Ljava/lang/CharSequence;II)I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract countNotCharsReversed(C)I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract countNotCharsReversed(CI)I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract countNotCharsReversed(CII)I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract countNotCharsReversed(Ljava/lang/CharSequence;)I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract countNotCharsReversed(Ljava/lang/CharSequence;I)I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract countNotCharsReversed(Ljava/lang/CharSequence;II)I
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract countOf()I
.end method

.method public abstract countOf(C)I
.end method

.method public abstract countOf(CI)I
.end method

.method public abstract countOf(CII)I
.end method

.method public abstract countOfAny(Ljava/lang/CharSequence;)I
.end method

.method public abstract countOfAny(Ljava/lang/CharSequence;I)I
.end method

.method public abstract countOfAny(Ljava/lang/CharSequence;II)I
.end method

.method public abstract countOfAnyNot(Ljava/lang/CharSequence;)I
.end method

.method public abstract countOfAnyNot(Ljava/lang/CharSequence;I)I
.end method

.method public abstract countOfAnyNot(Ljava/lang/CharSequence;II)I
.end method

.method public abstract countOfNot()I
.end method

.method public abstract countOfNot(C)I
.end method

.method public abstract countOfNot(CI)I
.end method

.method public abstract countOfNot(CII)I
.end method

.method public abstract countTrailing()I
.end method

.method public abstract countTrailing(C)I
.end method

.method public abstract countTrailing(CI)I
.end method

.method public abstract countTrailing(CII)I
.end method

.method public abstract countTrailing(Ljava/lang/CharSequence;)I
.end method

.method public abstract countTrailing(Ljava/lang/CharSequence;I)I
.end method

.method public abstract countTrailing(Ljava/lang/CharSequence;II)I
.end method

.method public abstract countTrailingNot()I
.end method

.method public abstract countTrailingNot(C)I
.end method

.method public abstract countTrailingNot(CI)I
.end method

.method public abstract countTrailingNot(CII)I
.end method

.method public abstract countTrailingNot(Ljava/lang/CharSequence;)I
.end method

.method public abstract countTrailingNot(Ljava/lang/CharSequence;I)I
.end method

.method public abstract countTrailingNot(Ljava/lang/CharSequence;II)I
.end method

.method public abstract endCharAt(I)C
.end method

.method public abstract endOfDelimitedBy(Ljava/lang/CharSequence;I)I
.end method

.method public abstract endOfDelimitedByAny(Ljava/lang/CharSequence;I)I
.end method

.method public abstract endOfDelimitedByAnyNot(Ljava/lang/CharSequence;I)I
.end method

.method public abstract endOfLine(I)I
.end method

.method public abstract endOfLineAnyEOL(I)I
.end method

.method public abstract endSequence(I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract endSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract endsWith(Ljava/lang/CharSequence;)Z
.end method

.method public abstract endsWith(Ljava/lang/CharSequence;Z)Z
.end method

.method public abstract endsWithIgnoreCase(Ljava/lang/CharSequence;)Z
.end method

.method public abstract eolLength()I
.end method

.method public abstract eolLength(I)I
.end method

.method public abstract equals(Ljava/lang/Object;Z)Z
.end method

.method public abstract equalsIgnoreCase(Ljava/lang/CharSequence;)Z
.end method

.method public abstract firstChar()C
.end method

.method public abstract getBase()Ljava/lang/Object;
.end method

.method public abstract getBaseSequence()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract getColumnAtIndex(I)I
.end method

.method public abstract getEndOffset()I
.end method

.method public abstract getIndexOffset(I)I
.end method

.method public abstract getIndexRange(II)Lcom/vladsch/flexmark/util/sequence/Range;
.end method

.method public abstract getLineColumnAtIndex(I)Lcom/vladsch/flexmark/util/Pair;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lcom/vladsch/flexmark/util/Pair<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getSourceRange()Lcom/vladsch/flexmark/util/sequence/Range;
.end method

.method public abstract getStartOffset()I
.end method

.method public abstract ifNull(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract ifNullEmptyAfter(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract ifNullEmptyBefore(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract indexOf(C)I
.end method

.method public abstract indexOf(CI)I
.end method

.method public abstract indexOf(CII)I
.end method

.method public abstract indexOf(Ljava/lang/CharSequence;)I
.end method

.method public abstract indexOf(Ljava/lang/CharSequence;I)I
.end method

.method public abstract indexOf(Ljava/lang/CharSequence;II)I
.end method

.method public abstract indexOfAll(Ljava/lang/CharSequence;)[I
.end method

.method public abstract indexOfAny(CC)I
.end method

.method public abstract indexOfAny(CCC)I
.end method

.method public abstract indexOfAny(CCCI)I
.end method

.method public abstract indexOfAny(CCCII)I
.end method

.method public abstract indexOfAny(CCI)I
.end method

.method public abstract indexOfAny(CCII)I
.end method

.method public abstract indexOfAny(Ljava/lang/CharSequence;)I
.end method

.method public abstract indexOfAny(Ljava/lang/CharSequence;I)I
.end method

.method public abstract indexOfAny(Ljava/lang/CharSequence;II)I
.end method

.method public abstract indexOfAnyNot(CC)I
.end method

.method public abstract indexOfAnyNot(CCC)I
.end method

.method public abstract indexOfAnyNot(CCCI)I
.end method

.method public abstract indexOfAnyNot(CCCII)I
.end method

.method public abstract indexOfAnyNot(CCI)I
.end method

.method public abstract indexOfAnyNot(CCII)I
.end method

.method public abstract indexOfAnyNot(Ljava/lang/CharSequence;)I
.end method

.method public abstract indexOfAnyNot(Ljava/lang/CharSequence;I)I
.end method

.method public abstract indexOfAnyNot(Ljava/lang/CharSequence;II)I
.end method

.method public abstract indexOfNot(C)I
.end method

.method public abstract indexOfNot(CI)I
.end method

.method public abstract indexOfNot(CII)I
.end method

.method public abstract intersect(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract isBlank()Z
.end method

.method public abstract isContinuationOf(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Z
.end method

.method public abstract isContinuedBy(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Z
.end method

.method public abstract isEmpty()Z
.end method

.method public abstract isNotNull()Z
.end method

.method public abstract isNull()Z
.end method

.method public abstract lastChar()C
.end method

.method public abstract lastIndexOf(C)I
.end method

.method public abstract lastIndexOf(CI)I
.end method

.method public abstract lastIndexOf(CII)I
.end method

.method public abstract lastIndexOf(Ljava/lang/CharSequence;)I
.end method

.method public abstract lastIndexOf(Ljava/lang/CharSequence;I)I
.end method

.method public abstract lastIndexOf(Ljava/lang/CharSequence;II)I
.end method

.method public abstract lastIndexOfAny(CC)I
.end method

.method public abstract lastIndexOfAny(CCC)I
.end method

.method public abstract lastIndexOfAny(CCCI)I
.end method

.method public abstract lastIndexOfAny(CCCII)I
.end method

.method public abstract lastIndexOfAny(CCI)I
.end method

.method public abstract lastIndexOfAny(CCII)I
.end method

.method public abstract lastIndexOfAny(Ljava/lang/CharSequence;)I
.end method

.method public abstract lastIndexOfAny(Ljava/lang/CharSequence;I)I
.end method

.method public abstract lastIndexOfAny(Ljava/lang/CharSequence;II)I
.end method

.method public abstract lastIndexOfAnyNot(CC)I
.end method

.method public abstract lastIndexOfAnyNot(CCC)I
.end method

.method public abstract lastIndexOfAnyNot(CCCI)I
.end method

.method public abstract lastIndexOfAnyNot(CCCII)I
.end method

.method public abstract lastIndexOfAnyNot(CCI)I
.end method

.method public abstract lastIndexOfAnyNot(CCII)I
.end method

.method public abstract lastIndexOfAnyNot(Ljava/lang/CharSequence;)I
.end method

.method public abstract lastIndexOfAnyNot(Ljava/lang/CharSequence;I)I
.end method

.method public abstract lastIndexOfAnyNot(Ljava/lang/CharSequence;II)I
.end method

.method public abstract lastIndexOfNot(C)I
.end method

.method public abstract lastIndexOfNot(CI)I
.end method

.method public abstract lastIndexOfNot(CII)I
.end method

.method public abstract lineAt(I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract lineAtAnyEOL(I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract matchChars(Ljava/lang/CharSequence;)Z
.end method

.method public abstract matchChars(Ljava/lang/CharSequence;I)Z
.end method

.method public abstract matchChars(Ljava/lang/CharSequence;IZ)Z
.end method

.method public abstract matchChars(Ljava/lang/CharSequence;Z)Z
.end method

.method public abstract matchCharsIgnoreCase(Ljava/lang/CharSequence;)Z
.end method

.method public abstract matchCharsIgnoreCase(Ljava/lang/CharSequence;I)Z
.end method

.method public abstract matchCharsReversed(Ljava/lang/CharSequence;I)Z
.end method

.method public abstract matchCharsReversed(Ljava/lang/CharSequence;IZ)Z
.end method

.method public abstract matchCharsReversedIgnoreCase(Ljava/lang/CharSequence;I)Z
.end method

.method public abstract matches(Ljava/lang/CharSequence;)Z
.end method

.method public abstract matches(Ljava/lang/CharSequence;Z)Z
.end method

.method public abstract matchesIgnoreCase(Ljava/lang/CharSequence;)Z
.end method

.method public abstract midCharAt(I)C
.end method

.method public abstract midSequence(I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract midSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract normalizeEOL(Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract normalizeEOL()Ljava/lang/String;
.end method

.method public abstract normalizeEndWithEOL(Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract normalizeEndWithEOL()Ljava/lang/String;
.end method

.method public abstract nullIf(Z)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public varargs abstract nullIf([Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract nullIfBlank()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract nullIfEmpty()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public varargs abstract nullIfEndsWith([Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public varargs abstract nullIfEndsWithNot([Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public varargs abstract nullIfNot([Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public varargs abstract nullIfStartsWith([Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public varargs abstract nullIfStartsWithNot([Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract padEnd(I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract padEnd(IC)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract padStart(I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract padStart(IC)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract prefixOf(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract removePrefix(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract removePrefix(Ljava/lang/CharSequence;Z)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract removePrefixIgnoreCase(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract removeProperPrefix(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract removeProperPrefix(Ljava/lang/CharSequence;Z)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract removeProperPrefixIgnoreCase(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract removeProperSuffix(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract removeProperSuffix(Ljava/lang/CharSequence;Z)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract removeProperSuffixIgnoreCase(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract removeSuffix(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract removeSuffix(Ljava/lang/CharSequence;Z)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract removeSuffixIgnoreCase(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract spliceAtEnd(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract split(C)[Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract split(CI)[Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract split(CII)[Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract split(CIILjava/lang/String;)[Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract split(Ljava/lang/CharSequence;)[Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract split(Ljava/lang/CharSequence;I)[Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract split(Ljava/lang/CharSequence;II)[Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract split(Ljava/lang/CharSequence;IILjava/lang/String;)[Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract startOfDelimitedBy(Ljava/lang/CharSequence;I)I
.end method

.method public abstract startOfDelimitedByAny(Ljava/lang/CharSequence;I)I
.end method

.method public abstract startOfDelimitedByAnyNot(Ljava/lang/CharSequence;I)I
.end method

.method public abstract startOfLine(I)I
.end method

.method public abstract startOfLineAnyEOL(I)I
.end method

.method public abstract startsWith(Ljava/lang/CharSequence;)Z
.end method

.method public abstract startsWith(Ljava/lang/CharSequence;Z)Z
.end method

.method public abstract startsWithIgnoreCase(Ljava/lang/CharSequence;)Z
.end method

.method public abstract subSequence(I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract subSequence(II)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract subSequence(Lcom/vladsch/flexmark/util/sequence/Range;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract suffixOf(Lcom/vladsch/flexmark/util/sequence/BasedSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract toLowerCase()Lcom/vladsch/flexmark/util/sequence/MappedSequence;
.end method

.method public abstract toLowerCase(Ljava/util/Locale;)Lcom/vladsch/flexmark/util/sequence/MappedSequence;
.end method

.method public abstract toMapped(Lcom/vladsch/flexmark/util/mappers/CharMapper;)Lcom/vladsch/flexmark/util/sequence/MappedSequence;
.end method

.method public abstract toUpperCase()Lcom/vladsch/flexmark/util/sequence/MappedSequence;
.end method

.method public abstract toUpperCase(Ljava/util/Locale;)Lcom/vladsch/flexmark/util/sequence/MappedSequence;
.end method

.method public abstract toVisibleWhitespaceString()Ljava/lang/String;
.end method

.method public abstract trim()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract trim(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract trimEOL()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract trimEnd()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract trimEnd(I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract trimEnd(ILjava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract trimEnd(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract trimLeadBlankLines()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract trimStart()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract trimStart(I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract trimStart(ILjava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract trimStart(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract trimTailBlankLines()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract trimmedEOL()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract trimmedEnd()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract trimmedEnd(I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract trimmedEnd(ILjava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract trimmedEnd(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract trimmedStart()Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract trimmedStart(I)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract trimmedStart(ILjava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract trimmedStart(Ljava/lang/CharSequence;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract unescape(Lcom/vladsch/flexmark/util/sequence/ReplacedTextMapper;)Lcom/vladsch/flexmark/util/sequence/BasedSequence;
.end method

.method public abstract unescape()Ljava/lang/String;
.end method

.method public abstract unescapeNoEntities()Ljava/lang/String;
.end method
