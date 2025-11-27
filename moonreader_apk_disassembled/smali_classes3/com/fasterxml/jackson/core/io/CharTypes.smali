.class public final Lcom/fasterxml/jackson/core/io/CharTypes;
.super Ljava/lang/Object;
.source "CharTypes.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/fasterxml/jackson/core/io/CharTypes$AltEscapes;
    }
.end annotation


# static fields
.field protected static final HB:[B

.field protected static final HBlower:[B

.field protected static final HC:[C

.field protected static final HClower:[C

.field protected static final sHexValues:[I

.field protected static final sInputCodes:[I

.field protected static final sInputCodesComment:[I

.field protected static final sInputCodesJsNames:[I

.field protected static final sInputCodesUTF8:[I

.field protected static final sInputCodesUtf8JsNames:[I

.field protected static final sInputCodesWS:[I

.field protected static final sOutputEscapes128:[I


# direct methods
.method static constructor <clinit>()V
    .locals 15

    .line 7
    const-string v0, "0123456789ABCDEF"

    invoke-virtual {v0}, Ljava/lang/String;->toCharArray()[C

    move-result-object v0

    sput-object v0, Lcom/fasterxml/jackson/core/io/CharTypes;->HC:[C

    .line 8
    const-string v1, "0123456789abcdef"

    invoke-virtual {v1}, Ljava/lang/String;->toCharArray()[C

    move-result-object v1

    sput-object v1, Lcom/fasterxml/jackson/core/io/CharTypes;->HClower:[C

    .line 12
    array-length v0, v0

    .line 13
    new-array v1, v0, [B

    sput-object v1, Lcom/fasterxml/jackson/core/io/CharTypes;->HB:[B

    .line 14
    new-array v1, v0, [B

    sput-object v1, Lcom/fasterxml/jackson/core/io/CharTypes;->HBlower:[B

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_0

    .line 16
    sget-object v3, Lcom/fasterxml/jackson/core/io/CharTypes;->HB:[B

    sget-object v4, Lcom/fasterxml/jackson/core/io/CharTypes;->HC:[C

    aget-char v4, v4, v2

    int-to-byte v4, v4

    aput-byte v4, v3, v2

    .line 17
    sget-object v3, Lcom/fasterxml/jackson/core/io/CharTypes;->HBlower:[B

    sget-object v4, Lcom/fasterxml/jackson/core/io/CharTypes;->HClower:[C

    aget-char v4, v4, v2

    int-to-byte v4, v4

    aput-byte v4, v3, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    const/16 v0, 0x100

    .line 31
    new-array v2, v0, [I

    const/4 v3, 0x0

    :goto_1
    const/16 v4, 0x20

    const/4 v5, -0x1

    if-ge v3, v4, :cond_1

    .line 34
    aput v5, v2, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_1
    const/16 v3, 0x22

    const/4 v6, 0x1

    .line 37
    aput v6, v2, v3

    const/16 v7, 0x5c

    .line 38
    aput v6, v2, v7

    .line 39
    sput-object v2, Lcom/fasterxml/jackson/core/io/CharTypes;->sInputCodes:[I

    .line 48
    array-length v8, v2

    new-array v9, v8, [I

    .line 49
    invoke-static {v2, v1, v9, v1, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    const/16 v2, 0x80

    const/16 v8, 0x80

    :goto_2
    if-ge v8, v0, :cond_5

    and-int/lit16 v10, v8, 0xe0

    const/16 v11, 0xc0

    if-ne v10, v11, :cond_2

    const/4 v10, 0x2

    goto :goto_3

    :cond_2
    and-int/lit16 v10, v8, 0xf0

    const/16 v11, 0xe0

    if-ne v10, v11, :cond_3

    const/4 v10, 0x3

    goto :goto_3

    :cond_3
    and-int/lit16 v10, v8, 0xf8

    const/16 v11, 0xf0

    if-ne v10, v11, :cond_4

    const/4 v10, 0x4

    goto :goto_3

    :cond_4
    const/4 v10, -0x1

    .line 65
    :goto_3
    aput v10, v9, v8

    add-int/lit8 v8, v8, 0x1

    goto :goto_2

    .line 67
    :cond_5
    sput-object v9, Lcom/fasterxml/jackson/core/io/CharTypes;->sInputCodesUTF8:[I

    .line 78
    new-array v8, v0, [I

    .line 80
    invoke-static {v8, v5}, Ljava/util/Arrays;->fill([II)V

    const/16 v9, 0x21

    :goto_4
    if-ge v9, v0, :cond_7

    int-to-char v10, v9

    .line 83
    invoke-static {v10}, Ljava/lang/Character;->isJavaIdentifierPart(C)Z

    move-result v10

    if-eqz v10, :cond_6

    .line 84
    aput v1, v8, v9

    :cond_6
    add-int/lit8 v9, v9, 0x1

    goto :goto_4

    :cond_7
    const/16 v9, 0x40

    .line 90
    aput v1, v8, v9

    const/16 v9, 0x23

    .line 91
    aput v1, v8, v9

    const/16 v10, 0x2a

    .line 92
    aput v1, v8, v10

    const/16 v11, 0x2d

    .line 93
    aput v1, v8, v11

    const/16 v11, 0x2b

    .line 94
    aput v1, v8, v11

    .line 95
    sput-object v8, Lcom/fasterxml/jackson/core/io/CharTypes;->sInputCodesJsNames:[I

    .line 105
    new-array v11, v0, [I

    .line 107
    invoke-static {v8, v1, v11, v1, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 108
    invoke-static {v11, v2, v2, v1}, Ljava/util/Arrays;->fill([IIII)V

    .line 109
    sput-object v11, Lcom/fasterxml/jackson/core/io/CharTypes;->sInputCodesUtf8JsNames:[I

    .line 118
    new-array v8, v0, [I

    .line 120
    sget-object v11, Lcom/fasterxml/jackson/core/io/CharTypes;->sInputCodesUTF8:[I

    invoke-static {v11, v2, v8, v2, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 123
    invoke-static {v8, v1, v4, v5}, Ljava/util/Arrays;->fill([IIII)V

    const/16 v12, 0x9

    .line 124
    aput v1, v8, v12

    const/16 v13, 0xa

    .line 125
    aput v13, v8, v13

    const/16 v14, 0xd

    .line 126
    aput v14, v8, v14

    .line 127
    aput v10, v8, v10

    .line 128
    sput-object v8, Lcom/fasterxml/jackson/core/io/CharTypes;->sInputCodesComment:[I

    .line 139
    new-array v8, v0, [I

    .line 140
    invoke-static {v11, v2, v8, v2, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 145
    invoke-static {v8, v1, v4, v5}, Ljava/util/Arrays;->fill([IIII)V

    .line 146
    aput v6, v8, v4

    .line 147
    aput v6, v8, v12

    .line 148
    aput v13, v8, v13

    .line 149
    aput v14, v8, v14

    const/16 v6, 0x2f

    .line 150
    aput v6, v8, v6

    .line 151
    aput v9, v8, v9

    .line 152
    sput-object v8, Lcom/fasterxml/jackson/core/io/CharTypes;->sInputCodesWS:[I

    .line 161
    new-array v2, v2, [I

    const/4 v6, 0x0

    :goto_5
    if-ge v6, v4, :cond_8

    .line 165
    aput v5, v2, v6

    add-int/lit8 v6, v6, 0x1

    goto :goto_5

    .line 168
    :cond_8
    aput v3, v2, v3

    .line 169
    aput v7, v2, v7

    const/16 v3, 0x8

    const/16 v4, 0x62

    .line 171
    aput v4, v2, v3

    const/16 v3, 0x74

    .line 172
    aput v3, v2, v12

    const/16 v3, 0xc

    const/16 v4, 0x66

    .line 173
    aput v4, v2, v3

    const/16 v3, 0x6e

    .line 174
    aput v3, v2, v13

    const/16 v3, 0x72

    .line 175
    aput v3, v2, v14

    .line 176
    sput-object v2, Lcom/fasterxml/jackson/core/io/CharTypes;->sOutputEscapes128:[I

    .line 186
    new-array v0, v0, [I

    sput-object v0, Lcom/fasterxml/jackson/core/io/CharTypes;->sHexValues:[I

    .line 188
    invoke-static {v0, v5}, Ljava/util/Arrays;->fill([II)V

    const/4 v0, 0x0

    :goto_6
    if-ge v0, v13, :cond_9

    .line 190
    sget-object v2, Lcom/fasterxml/jackson/core/io/CharTypes;->sHexValues:[I

    add-int/lit8 v3, v0, 0x30

    aput v0, v2, v3

    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    :cond_9
    :goto_7
    const/4 v0, 0x6

    if-ge v1, v0, :cond_a

    .line 193
    sget-object v0, Lcom/fasterxml/jackson/core/io/CharTypes;->sHexValues:[I

    add-int/lit8 v2, v1, 0x61

    add-int/lit8 v3, v1, 0xa

    aput v3, v0, v2

    add-int/lit8 v2, v1, 0x41

    .line 194
    aput v3, v0, v2

    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    :cond_a
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static appendQuoted(Ljava/lang/StringBuilder;Ljava/lang/String;)V
    .locals 7

    .line 260
    sget-object v0, Lcom/fasterxml/jackson/core/io/CharTypes;->sOutputEscapes128:[I

    .line 261
    array-length v1, v0

    .line 262
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_3

    .line 263
    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v4

    if-ge v4, v1, :cond_2

    .line 264
    aget v5, v0, v4

    if-nez v5, :cond_0

    goto :goto_1

    :cond_0
    const/16 v5, 0x5c

    .line 268
    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 269
    aget v5, v0, v4

    if-gez v5, :cond_1

    const/16 v5, 0x75

    .line 279
    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    const/16 v5, 0x30

    .line 280
    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 281
    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 283
    sget-object v5, Lcom/fasterxml/jackson/core/io/CharTypes;->HC:[C

    shr-int/lit8 v6, v4, 0x4

    aget-char v6, v5, v6

    invoke-virtual {p0, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    and-int/lit8 v4, v4, 0xf

    .line 284
    aget-char v4, v5, v4

    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_2

    :cond_1
    int-to-char v4, v5

    .line 286
    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 265
    :cond_2
    :goto_1
    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_3
    return-void
.end method

.method public static charToHex(I)I
    .locals 1

    .line 240
    sget-object v0, Lcom/fasterxml/jackson/core/io/CharTypes;->sHexValues:[I

    and-int/lit16 p0, p0, 0xff

    aget p0, v0, p0

    return p0
.end method

.method public static copyHexBytes()[B
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 v0, 0x1

    .line 308
    invoke-static {v0}, Lcom/fasterxml/jackson/core/io/CharTypes;->copyHexBytes(Z)[B

    move-result-object v0

    return-object v0
.end method

.method public static copyHexBytes(Z)[B
    .locals 0

    if-eqz p0, :cond_0

    .line 312
    sget-object p0, Lcom/fasterxml/jackson/core/io/CharTypes;->HB:[B

    invoke-virtual {p0}, [B->clone()Ljava/lang/Object;

    move-result-object p0

    :goto_0
    check-cast p0, [B

    return-object p0

    :cond_0
    sget-object p0, Lcom/fasterxml/jackson/core/io/CharTypes;->HBlower:[B

    invoke-virtual {p0}, [B->clone()Ljava/lang/Object;

    move-result-object p0

    goto :goto_0
.end method

.method public static copyHexChars()[C
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 v0, 0x1

    .line 296
    invoke-static {v0}, Lcom/fasterxml/jackson/core/io/CharTypes;->copyHexChars(Z)[C

    move-result-object v0

    return-object v0
.end method

.method public static copyHexChars(Z)[C
    .locals 0

    if-eqz p0, :cond_0

    .line 300
    sget-object p0, Lcom/fasterxml/jackson/core/io/CharTypes;->HC:[C

    invoke-virtual {p0}, [C->clone()Ljava/lang/Object;

    move-result-object p0

    :goto_0
    check-cast p0, [C

    return-object p0

    :cond_0
    sget-object p0, Lcom/fasterxml/jackson/core/io/CharTypes;->HClower:[C

    invoke-virtual {p0}, [C->clone()Ljava/lang/Object;

    move-result-object p0

    goto :goto_0
.end method

.method public static get7BitOutputEscapes()[I
    .locals 1

    .line 216
    sget-object v0, Lcom/fasterxml/jackson/core/io/CharTypes;->sOutputEscapes128:[I

    return-object v0
.end method

.method public static get7BitOutputEscapes(I)[I
    .locals 1

    const/16 v0, 0x22

    if-ne p0, v0, :cond_0

    .line 231
    sget-object p0, Lcom/fasterxml/jackson/core/io/CharTypes;->sOutputEscapes128:[I

    return-object p0

    .line 233
    :cond_0
    sget-object v0, Lcom/fasterxml/jackson/core/io/CharTypes$AltEscapes;->instance:Lcom/fasterxml/jackson/core/io/CharTypes$AltEscapes;

    invoke-virtual {v0, p0}, Lcom/fasterxml/jackson/core/io/CharTypes$AltEscapes;->escapesFor(I)[I

    move-result-object p0

    return-object p0
.end method

.method public static getInputCodeComment()[I
    .locals 1

    .line 204
    sget-object v0, Lcom/fasterxml/jackson/core/io/CharTypes;->sInputCodesComment:[I

    return-object v0
.end method

.method public static getInputCodeLatin1()[I
    .locals 1

    .line 198
    sget-object v0, Lcom/fasterxml/jackson/core/io/CharTypes;->sInputCodes:[I

    return-object v0
.end method

.method public static getInputCodeLatin1JsNames()[I
    .locals 1

    .line 201
    sget-object v0, Lcom/fasterxml/jackson/core/io/CharTypes;->sInputCodesJsNames:[I

    return-object v0
.end method

.method public static getInputCodeUtf8()[I
    .locals 1

    .line 199
    sget-object v0, Lcom/fasterxml/jackson/core/io/CharTypes;->sInputCodesUTF8:[I

    return-object v0
.end method

.method public static getInputCodeUtf8JsNames()[I
    .locals 1

    .line 202
    sget-object v0, Lcom/fasterxml/jackson/core/io/CharTypes;->sInputCodesUtf8JsNames:[I

    return-object v0
.end method

.method public static getInputCodeWS()[I
    .locals 1

    .line 205
    sget-object v0, Lcom/fasterxml/jackson/core/io/CharTypes;->sInputCodesWS:[I

    return-object v0
.end method

.method public static hexToChar(I)C
    .locals 1

    .line 246
    sget-object v0, Lcom/fasterxml/jackson/core/io/CharTypes;->HC:[C

    aget-char p0, v0, p0

    return p0
.end method
