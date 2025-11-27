.class public Lcom/vladsch/flexmark/util/format/RomanNumeral;
.super Ljava/lang/Object;
.source "RomanNumeral.java"


# static fields
.field public static final LOWERCASE_ROMAN_NUMERAL:Ljava/util/regex/Pattern;

.field public static final ROMAN_NUMERAL:Ljava/util/regex/Pattern;

.field private static final letters:[Ljava/lang/String;

.field private static final numbers:[I


# instance fields
.field private final num:I


# direct methods
.method static constructor <clinit>()V
    .locals 14

    const/16 v0, 0xd

    .line 25
    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/vladsch/flexmark/util/format/RomanNumeral;->numbers:[I

    .line 26
    const-string v12, "IV"

    const-string v13, "I"

    const-string v1, "M"

    const-string v2, "CM"

    const-string v3, "D"

    const-string v4, "CD"

    const-string v5, "C"

    const-string v6, "XC"

    const-string v7, "L"

    const-string v8, "XL"

    const-string v9, "X"

    const-string v10, "IX"

    const-string v11, "V"

    filled-new-array/range {v1 .. v13}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/vladsch/flexmark/util/format/RomanNumeral;->letters:[Ljava/lang/String;

    .line 29
    const-string v0, "M{0,3}(?:CM|DC{0,3}|CD|C{1,3})?(?:XC|LX{0,3}|XL|X{1,3})?(?:IX|VI{0,3}|IV|I{1,3})?"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/vladsch/flexmark/util/format/RomanNumeral;->ROMAN_NUMERAL:Ljava/util/regex/Pattern;

    .line 30
    const-string v0, "m{0,3}(?:cm|dc{0,3}|cd|c{1,3})?(?:xc|lx{0,3}|xl|x{1,3})?(?:ix|vi{0,3}|iv|i{1,3})?"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/vladsch/flexmark/util/format/RomanNumeral;->LOWERCASE_ROMAN_NUMERAL:Ljava/util/regex/Pattern;

    return-void

    :array_0
    .array-data 4
        0x3e8
        0x384
        0x1f4
        0x190
        0x64
        0x5a
        0x32
        0x28
        0xa
        0x9
        0x5
        0x4
        0x1
    .end array-data
.end method

.method public constructor <init>(I)V
    .locals 1

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    if-lt p1, v0, :cond_1

    const/16 v0, 0xf9f

    if-gt p1, v0, :cond_0

    .line 40
    iput p1, p0, Lcom/vladsch/flexmark/util/format/RomanNumeral;->num:I

    return-void

    .line 39
    :cond_0
    new-instance p1, Ljava/lang/NumberFormatException;

    const-string v0, "Value of RomanNumeral must be 3999 or less."

    invoke-direct {p1, v0}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 37
    :cond_1
    new-instance p1, Ljava/lang/NumberFormatException;

    const-string v0, "Value of RomanNumeral must be positive."

    invoke-direct {p1, v0}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 5

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 49
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_5

    .line 52
    invoke-virtual {p1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 57
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v0, v2, :cond_3

    .line 59
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 60
    invoke-direct {p0, v2}, Lcom/vladsch/flexmark/util/format/RomanNumeral;->letterToNumber(C)I

    move-result v3

    if-ltz v3, :cond_2

    add-int/lit8 v2, v0, 0x1

    .line 67
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v4

    if-ne v2, v4, :cond_1

    :cond_0
    add-int/2addr v1, v3

    move v0, v2

    goto :goto_0

    .line 75
    :cond_1
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-direct {p0, v4}, Lcom/vladsch/flexmark/util/format/RomanNumeral;->letterToNumber(C)I

    move-result v4

    if-le v4, v3, :cond_0

    sub-int/2addr v4, v3

    add-int/2addr v1, v4

    add-int/lit8 v0, v0, 0x2

    goto :goto_0

    .line 63
    :cond_2
    new-instance p1, Ljava/lang/NumberFormatException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Illegal character \""

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const-string v1, "\" in roman numeral."

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_3
    const/16 p1, 0xf9f

    if-gt v1, p1, :cond_4

    .line 90
    iput v1, p0, Lcom/vladsch/flexmark/util/format/RomanNumeral;->num:I

    return-void

    .line 88
    :cond_4
    new-instance p1, Ljava/lang/NumberFormatException;

    const-string v0, "Roman numeral must have value 3999 or less."

    invoke-direct {p1, v0}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 50
    :cond_5
    new-instance p1, Ljava/lang/NumberFormatException;

    const-string v0, "An empty string does not define a Roman numeral."

    invoke-direct {p1, v0}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private letterToNumber(C)I
    .locals 1

    const/16 v0, 0x43

    if-eq p1, v0, :cond_6

    const/16 v0, 0x44

    if-eq p1, v0, :cond_5

    const/16 v0, 0x49

    if-eq p1, v0, :cond_4

    const/16 v0, 0x56

    if-eq p1, v0, :cond_3

    const/16 v0, 0x58

    if-eq p1, v0, :cond_2

    const/16 v0, 0x4c

    if-eq p1, v0, :cond_1

    const/16 v0, 0x4d

    if-eq p1, v0, :cond_0

    const/4 p1, -0x1

    return p1

    :cond_0
    const/16 p1, 0x3e8

    return p1

    :cond_1
    const/16 p1, 0x32

    return p1

    :cond_2
    const/16 p1, 0xa

    return p1

    :cond_3
    const/4 p1, 0x5

    return p1

    :cond_4
    const/4 p1, 0x1

    return p1

    :cond_5
    const/16 p1, 0x1f4

    return p1

    :cond_6
    const/16 p1, 0x64

    return p1
.end method


# virtual methods
.method public toInt()I
    .locals 1

    .line 131
    iget v0, p0, Lcom/vladsch/flexmark/util/format/RomanNumeral;->num:I

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .line 118
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 119
    iget v1, p0, Lcom/vladsch/flexmark/util/format/RomanNumeral;->num:I

    const/4 v2, 0x0

    .line 120
    :goto_0
    sget-object v3, Lcom/vladsch/flexmark/util/format/RomanNumeral;->numbers:[I

    array-length v3, v3

    if-ge v2, v3, :cond_1

    .line 121
    :goto_1
    sget-object v3, Lcom/vladsch/flexmark/util/format/RomanNumeral;->numbers:[I

    aget v4, v3, v2

    if-lt v1, v4, :cond_0

    .line 122
    sget-object v4, Lcom/vladsch/flexmark/util/format/RomanNumeral;->letters:[Ljava/lang/String;

    aget-object v4, v4, v2

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    aget v3, v3, v2

    sub-int/2addr v1, v3

    goto :goto_1

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 126
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
