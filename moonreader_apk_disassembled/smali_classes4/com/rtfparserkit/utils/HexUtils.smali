.class public Lcom/rtfparserkit/utils/HexUtils;
.super Ljava/lang/Object;
.source "HexUtils.java"


# static fields
.field private static final HEX_MAP:[I


# direct methods
.method static constructor <clinit>()V
    .locals 8

    const/16 v0, 0x67

    .line 73
    new-array v0, v0, [I

    sput-object v0, Lcom/rtfparserkit/utils/HexUtils;->HEX_MAP:[I

    const/4 v1, -0x1

    .line 76
    invoke-static {v0, v1}, Ljava/util/Arrays;->fill([II)V

    const/16 v1, 0x30

    const/4 v2, 0x0

    .line 78
    aput v2, v0, v1

    const/16 v1, 0x31

    const/4 v2, 0x1

    .line 79
    aput v2, v0, v1

    const/16 v1, 0x32

    const/4 v2, 0x2

    .line 80
    aput v2, v0, v1

    const/16 v1, 0x33

    const/4 v2, 0x3

    .line 81
    aput v2, v0, v1

    const/16 v1, 0x34

    const/4 v2, 0x4

    .line 82
    aput v2, v0, v1

    const/16 v1, 0x35

    const/4 v2, 0x5

    .line 83
    aput v2, v0, v1

    const/16 v1, 0x36

    const/4 v2, 0x6

    .line 84
    aput v2, v0, v1

    const/16 v1, 0x37

    const/4 v2, 0x7

    .line 85
    aput v2, v0, v1

    const/16 v1, 0x38

    const/16 v2, 0x8

    .line 86
    aput v2, v0, v1

    const/16 v1, 0x39

    const/16 v2, 0x9

    .line 87
    aput v2, v0, v1

    const/16 v1, 0x41

    const/16 v2, 0xa

    .line 89
    aput v2, v0, v1

    const/16 v1, 0x42

    const/16 v3, 0xb

    .line 90
    aput v3, v0, v1

    const/16 v1, 0x43

    const/16 v4, 0xc

    .line 91
    aput v4, v0, v1

    const/16 v1, 0x44

    const/16 v5, 0xd

    .line 92
    aput v5, v0, v1

    const/16 v1, 0x45

    const/16 v6, 0xe

    .line 93
    aput v6, v0, v1

    const/16 v1, 0x46

    const/16 v7, 0xf

    .line 94
    aput v7, v0, v1

    const/16 v1, 0x61

    .line 96
    aput v2, v0, v1

    const/16 v1, 0x62

    .line 97
    aput v3, v0, v1

    const/16 v1, 0x63

    .line 98
    aput v4, v0, v1

    const/16 v1, 0x64

    .line 99
    aput v5, v0, v1

    const/16 v1, 0x65

    .line 100
    aput v6, v0, v1

    const/16 v1, 0x66

    .line 101
    aput v7, v0, v1

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static parseHexDigit(I)I
    .locals 3

    const/4 v0, -0x1

    .line 35
    :try_start_0
    sget-object v1, Lcom/rtfparserkit/utils/HexUtils;->HEX_MAP:[I

    aget v1, v1, p0
    :try_end_0
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    nop

    const/4 v1, -0x1

    :goto_0
    if-eq v1, v0, :cond_0

    return v1

    .line 45
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invalid hex digit "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static final parseHexString(Ljava/lang/String;)[B
    .locals 5

    .line 56
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    rem-int/lit8 v0, v0, 0x2

    if-nez v0, :cond_1

    .line 61
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    new-array v1, v0, [B

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_0

    mul-int/lit8 v3, v2, 0x2

    .line 65
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-static {v4}, Lcom/rtfparserkit/utils/HexUtils;->parseHexDigit(I)I

    move-result v4

    shl-int/lit8 v4, v4, 0x4

    add-int/lit8 v3, v3, 0x1

    .line 66
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Lcom/rtfparserkit/utils/HexUtils;->parseHexDigit(I)I

    move-result v3

    add-int/2addr v4, v3

    int-to-byte v3, v4

    .line 67
    aput-byte v3, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-object v1

    .line 58
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Invalid hex string"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
