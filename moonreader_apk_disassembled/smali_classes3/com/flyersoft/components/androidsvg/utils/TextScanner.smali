.class public Lcom/flyersoft/components/androidsvg/utils/TextScanner;
.super Ljava/lang/Object;
.source "TextScanner.java"


# instance fields
.field final input:Ljava/lang/String;

.field inputLength:I

.field private final numberParser:Lcom/flyersoft/components/androidsvg/utils/NumberParser;

.field position:I


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 28
    iput v0, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->position:I

    .line 31
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/NumberParser;

    invoke-direct {v0}, Lcom/flyersoft/components/androidsvg/utils/NumberParser;-><init>()V

    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->numberParser:Lcom/flyersoft/components/androidsvg/utils/NumberParser;

    .line 36
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->input:Ljava/lang/String;

    .line 37
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    iput p1, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->inputLength:I

    return-void
.end method


# virtual methods
.method advanceChar()I
    .locals 3

    .line 209
    iget v0, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->position:I

    iget v1, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->inputLength:I

    const/4 v2, -0x1

    if-ne v0, v1, :cond_0

    return v2

    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 211
    iput v0, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->position:I

    if-ge v0, v1, :cond_1

    .line 213
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->input:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    return v0

    :cond_1
    return v2
.end method

.method ahead()Ljava/lang/String;
    .locals 3

    .line 330
    iget v0, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->position:I

    .line 331
    :goto_0
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->empty()Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->input:Ljava/lang/String;

    iget v2, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->position:I

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-virtual {p0, v1}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->isWhitespace(I)Z

    move-result v1

    if-nez v1, :cond_0

    .line 332
    iget v1, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->position:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->position:I

    goto :goto_0

    .line 333
    :cond_0
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->input:Ljava/lang/String;

    iget v2, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->position:I

    invoke-virtual {v1, v0, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 334
    iput v0, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->position:I

    return-object v1
.end method

.method checkedNextFlag(Ljava/lang/Object;)Ljava/lang/Boolean;
    .locals 0

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 181
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipCommaWhitespace()Z

    .line 182
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->nextFlag()Ljava/lang/Boolean;

    move-result-object p1

    return-object p1
.end method

.method checkedNextFloat(F)F
    .locals 0

    .line 111
    invoke-static {p1}, Ljava/lang/Float;->isNaN(F)Z

    move-result p1

    if-eqz p1, :cond_0

    const/high16 p1, 0x7fc00000    # Float.NaN

    return p1

    .line 114
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipCommaWhitespace()Z

    .line 115
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->nextFloat()F

    move-result p1

    return p1
.end method

.method checkedNextFloat(Ljava/lang/Boolean;)F
    .locals 0

    if-nez p1, :cond_0

    const/high16 p1, 0x7fc00000    # Float.NaN

    return p1

    .line 123
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipCommaWhitespace()Z

    .line 124
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->nextFloat()F

    move-result p1

    return p1
.end method

.method public consume(C)Z
    .locals 3

    .line 187
    iget v0, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->position:I

    iget v1, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->inputLength:I

    const/4 v2, 0x1

    if-ge v0, v1, :cond_0

    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->input:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    if-ne v0, p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    if-eqz p1, :cond_1

    .line 189
    iget v0, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->position:I

    add-int/2addr v0, v2

    iput v0, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->position:I

    :cond_1
    return p1
.end method

.method public consume(Ljava/lang/String;)Z
    .locals 4

    .line 196
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    .line 197
    iget v1, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->position:I

    iget v2, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->inputLength:I

    sub-int/2addr v2, v0

    if-gt v1, v2, :cond_0

    iget-object v2, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->input:Ljava/lang/String;

    add-int v3, v1, v0

    invoke-virtual {v2, v1, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    if-eqz p1, :cond_1

    .line 199
    iget v1, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->position:I

    add-int/2addr v1, v0

    iput v1, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->position:I

    :cond_1
    return p1
.end method

.method public empty()Z
    .locals 2

    .line 45
    iget v0, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->position:I

    iget v1, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->inputLength:I

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method hasLetter()Z
    .locals 3

    .line 363
    iget v0, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->position:I

    iget v1, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->inputLength:I

    const/4 v2, 0x0

    if-ne v0, v1, :cond_0

    return v2

    .line 365
    :cond_0
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->input:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x61

    if-lt v0, v1, :cond_1

    const/16 v1, 0x7a

    if-le v0, v1, :cond_2

    :cond_1
    const/16 v1, 0x41

    if-lt v0, v1, :cond_3

    const/16 v1, 0x5a

    if-gt v0, v1, :cond_3

    :cond_2
    const/4 v0, 0x1

    return v0

    :cond_3
    return v2
.end method

.method isEOL(I)Z
    .locals 1

    const/16 v0, 0xa

    if-eq p1, v0, :cond_1

    const/16 v0, 0xd

    if-ne p1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    return p1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    return p1
.end method

.method isWhitespace(I)Z
    .locals 1

    const/16 v0, 0x20

    if-eq p1, v0, :cond_1

    const/16 v0, 0xa

    if-eq p1, v0, :cond_1

    const/16 v0, 0xd

    if-eq p1, v0, :cond_1

    const/16 v0, 0x9

    if-ne p1, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    return p1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    return p1
.end method

.method nextChar()Ljava/lang/Integer;
    .locals 3

    .line 141
    iget v0, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->position:I

    iget v1, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->inputLength:I

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 143
    :cond_0
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->input:Ljava/lang/String;

    add-int/lit8 v2, v0, 0x1

    iput v2, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->position:I

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method nextFlag()Ljava/lang/Boolean;
    .locals 4

    .line 163
    iget v0, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->position:I

    iget v1, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->inputLength:I

    const/4 v2, 0x0

    if-ne v0, v1, :cond_0

    return-object v2

    .line 165
    :cond_0
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->input:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x30

    const/16 v3, 0x31

    if-eq v0, v1, :cond_2

    if-ne v0, v3, :cond_1

    goto :goto_0

    :cond_1
    return-object v2

    .line 167
    :cond_2
    :goto_0
    iget v1, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->position:I

    const/4 v2, 0x1

    add-int/2addr v1, v2

    iput v1, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->position:I

    if-ne v0, v3, :cond_3

    goto :goto_1

    :cond_3
    const/4 v2, 0x0

    .line 168
    :goto_1
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0
.end method

.method public nextFloat()F
    .locals 4

    .line 84
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->numberParser:Lcom/flyersoft/components/androidsvg/utils/NumberParser;

    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->input:Ljava/lang/String;

    iget v2, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->position:I

    iget v3, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->inputLength:I

    invoke-virtual {v0, v1, v2, v3}, Lcom/flyersoft/components/androidsvg/utils/NumberParser;->parseNumber(Ljava/lang/String;II)F

    move-result v0

    .line 85
    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v1

    if-nez v1, :cond_0

    .line 86
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->numberParser:Lcom/flyersoft/components/androidsvg/utils/NumberParser;

    invoke-virtual {v1}, Lcom/flyersoft/components/androidsvg/utils/NumberParser;->getEndPos()I

    move-result v1

    iput v1, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->position:I

    :cond_0
    return v0
.end method

.method nextFunction()Ljava/lang/String;
    .locals 5

    .line 307
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->empty()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return-object v1

    .line 309
    :cond_0
    iget v0, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->position:I

    .line 311
    iget-object v2, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->input:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    :goto_0
    const/16 v3, 0x61

    if-lt v2, v3, :cond_1

    const/16 v3, 0x7a

    if-le v2, v3, :cond_2

    :cond_1
    const/16 v3, 0x41

    if-lt v2, v3, :cond_3

    const/16 v3, 0x5a

    if-gt v2, v3, :cond_3

    .line 313
    :cond_2
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->advanceChar()I

    move-result v2

    goto :goto_0

    .line 314
    :cond_3
    iget v3, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->position:I

    .line 315
    :goto_1
    invoke-virtual {p0, v2}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->isWhitespace(I)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 316
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->advanceChar()I

    move-result v2

    goto :goto_1

    :cond_4
    const/16 v4, 0x28

    if-ne v2, v4, :cond_5

    .line 318
    iget v1, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->position:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->position:I

    .line 319
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->input:Ljava/lang/String;

    invoke-virtual {v1, v0, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 321
    :cond_5
    iput v0, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->position:I

    return-object v1
.end method

.method nextInteger(Z)Ljava/lang/Integer;
    .locals 3

    .line 129
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->input:Ljava/lang/String;

    iget v1, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->position:I

    iget v2, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->inputLength:I

    invoke-static {v0, v1, v2, p1}, Lcom/flyersoft/components/androidsvg/utils/IntegerParser;->parseInt(Ljava/lang/String;IIZ)Lcom/flyersoft/components/androidsvg/utils/IntegerParser;

    move-result-object p1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 132
    :cond_0
    invoke-virtual {p1}, Lcom/flyersoft/components/androidsvg/utils/IntegerParser;->getEndPos()I

    move-result v0

    iput v0, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->position:I

    .line 133
    invoke-virtual {p1}, Lcom/flyersoft/components/androidsvg/utils/IntegerParser;->value()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    return-object p1
.end method

.method nextLength()Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;
    .locals 3

    .line 148
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->nextFloat()F

    move-result v0

    .line 149
    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 151
    :cond_0
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->nextUnit()Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    move-result-object v1

    if-nez v1, :cond_1

    .line 153
    new-instance v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    sget-object v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;->px:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    invoke-direct {v1, v0, v2}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;-><init>(FLcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;)V

    return-object v1

    .line 155
    :cond_1
    new-instance v2, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    invoke-direct {v2, v0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;-><init>(FLcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;)V

    return-object v2
.end method

.method public nextQuotedString()Ljava/lang/String;
    .locals 5

    .line 374
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->empty()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return-object v1

    .line 376
    :cond_0
    iget v0, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->position:I

    .line 377
    iget-object v2, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->input:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x27

    if-eq v2, v3, :cond_1

    const/16 v3, 0x22

    if-eq v2, v3, :cond_1

    return-object v1

    .line 381
    :cond_1
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->advanceChar()I

    move-result v3

    :goto_0
    const/4 v4, -0x1

    if-eq v3, v4, :cond_2

    if-eq v3, v2, :cond_2

    .line 383
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->advanceChar()I

    move-result v3

    goto :goto_0

    :cond_2
    if-ne v3, v4, :cond_3

    .line 385
    iput v0, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->position:I

    return-object v1

    .line 388
    :cond_3
    iget v1, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->position:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->position:I

    .line 389
    iget-object v2, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->input:Ljava/lang/String;

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {v2, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public nextToken()Ljava/lang/String;
    .locals 2

    const/16 v0, 0x20

    const/4 v1, 0x0

    .line 227
    invoke-virtual {p0, v0, v1}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->nextToken(CZ)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public nextToken(C)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    .line 237
    invoke-virtual {p0, p1, v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->nextToken(CZ)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method nextToken(CZ)Ljava/lang/String;
    .locals 3

    .line 257
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->empty()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return-object v1

    .line 260
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->input:Ljava/lang/String;

    iget v2, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->position:I

    invoke-virtual {v0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    if-nez p2, :cond_1

    .line 261
    invoke-virtual {p0, v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->isWhitespace(I)Z

    move-result v2

    if-nez v2, :cond_2

    :cond_1
    if-ne v0, p1, :cond_3

    :cond_2
    return-object v1

    .line 264
    :cond_3
    iget v0, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->position:I

    .line 265
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->advanceChar()I

    move-result v1

    :goto_0
    const/4 v2, -0x1

    if-eq v1, v2, :cond_6

    if-ne v1, p1, :cond_4

    goto :goto_1

    :cond_4
    if-nez p2, :cond_5

    .line 269
    invoke-virtual {p0, v1}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->isWhitespace(I)Z

    move-result v1

    if-eqz v1, :cond_5

    goto :goto_1

    .line 271
    :cond_5
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->advanceChar()I

    move-result v1

    goto :goto_0

    .line 273
    :cond_6
    :goto_1
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->input:Ljava/lang/String;

    iget p2, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->position:I

    invoke-virtual {p1, v0, p2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method nextTokenWithWhitespace(C)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x1

    .line 247
    invoke-virtual {p0, p1, v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->nextToken(CZ)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method nextUnit()Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;
    .locals 4

    .line 340
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->empty()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return-object v1

    .line 342
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->input:Ljava/lang/String;

    iget v2, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->position:I

    invoke-virtual {v0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v2, 0x25

    if-ne v0, v2, :cond_1

    .line 344
    iget v0, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->position:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->position:I

    .line 345
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;->percent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    return-object v0

    .line 347
    :cond_1
    iget v0, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->position:I

    iget v2, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->inputLength:I

    add-int/lit8 v2, v2, -0x2

    if-le v0, v2, :cond_2

    return-object v1

    .line 350
    :cond_2
    :try_start_0
    iget-object v2, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->input:Ljava/lang/String;

    add-int/lit8 v3, v0, 0x2

    invoke-virtual {v2, v0, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v0, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;->valueOf(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$Unit;

    move-result-object v0

    .line 351
    iget v2, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->position:I

    add-int/lit8 v2, v2, 0x2

    iput v2, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->position:I
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    return-object v1
.end method

.method public nextWord()Ljava/lang/String;
    .locals 7

    .line 283
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->empty()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return-object v1

    .line 285
    :cond_0
    iget v0, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->position:I

    .line 287
    iget-object v2, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->input:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x7a

    const/16 v4, 0x5a

    const/16 v5, 0x61

    const/16 v6, 0x41

    if-lt v2, v6, :cond_1

    if-le v2, v4, :cond_2

    :cond_1
    if-lt v2, v5, :cond_6

    if-gt v2, v3, :cond_6

    .line 290
    :cond_2
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->advanceChar()I

    move-result v1

    :goto_0
    if-lt v1, v6, :cond_3

    if-le v1, v4, :cond_4

    :cond_3
    if-lt v1, v5, :cond_5

    if-gt v1, v3, :cond_5

    .line 292
    :cond_4
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->advanceChar()I

    move-result v1

    goto :goto_0

    .line 293
    :cond_5
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->input:Ljava/lang/String;

    iget v2, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->position:I

    invoke-virtual {v1, v0, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 295
    :cond_6
    iput v0, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->position:I

    return-object v1
.end method

.method possibleNextFloat()F
    .locals 4

    .line 97
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipCommaWhitespace()Z

    .line 98
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->numberParser:Lcom/flyersoft/components/androidsvg/utils/NumberParser;

    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->input:Ljava/lang/String;

    iget v2, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->position:I

    iget v3, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->inputLength:I

    invoke-virtual {v0, v1, v2, v3}, Lcom/flyersoft/components/androidsvg/utils/NumberParser;->parseNumber(Ljava/lang/String;II)F

    move-result v0

    .line 99
    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v1

    if-nez v1, :cond_0

    .line 100
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->numberParser:Lcom/flyersoft/components/androidsvg/utils/NumberParser;

    invoke-virtual {v1}, Lcom/flyersoft/components/androidsvg/utils/NumberParser;->getEndPos()I

    move-result v1

    iput v1, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->position:I

    :cond_0
    return v0
.end method

.method restOfText()Ljava/lang/String;
    .locals 2

    .line 397
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->empty()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    .line 400
    :cond_0
    iget v0, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->position:I

    .line 401
    iget v1, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->inputLength:I

    iput v1, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->position:I

    .line 402
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->input:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public skipCommaWhitespace()Z
    .locals 3

    .line 71
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipWhitespace()V

    .line 72
    iget v0, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->position:I

    iget v1, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->inputLength:I

    const/4 v2, 0x0

    if-ne v0, v1, :cond_0

    return v2

    .line 74
    :cond_0
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->input:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x2c

    if-eq v0, v1, :cond_1

    return v2

    .line 76
    :cond_1
    iget v0, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->position:I

    const/4 v1, 0x1

    add-int/2addr v0, v1

    iput v0, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->position:I

    .line 77
    invoke-virtual {p0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->skipWhitespace()V

    return v1
.end method

.method public skipWhitespace()V
    .locals 2

    .line 55
    :goto_0
    iget v0, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->position:I

    iget v1, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->inputLength:I

    if-ge v0, v1, :cond_1

    .line 56
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->input:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-virtual {p0, v0}, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->isWhitespace(I)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_1

    .line 58
    :cond_0
    iget v0, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->position:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/flyersoft/components/androidsvg/utils/TextScanner;->position:I

    goto :goto_0

    :cond_1
    :goto_1
    return-void
.end method
