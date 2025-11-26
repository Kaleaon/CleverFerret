.class public final enum Lcom/vladsch/flexmark/util/format/NumberFormat;
.super Ljava/lang/Enum;
.source "NumberFormat.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/vladsch/flexmark/util/format/NumberFormat;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/vladsch/flexmark/util/format/NumberFormat;

.field public static final enum ARABIC:Lcom/vladsch/flexmark/util/format/NumberFormat;

.field public static final enum CUSTOM:Lcom/vladsch/flexmark/util/format/NumberFormat;

.field public static final enum LETTERS:Lcom/vladsch/flexmark/util/format/NumberFormat;

.field public static final enum NONE:Lcom/vladsch/flexmark/util/format/NumberFormat;

.field public static final enum ROMAN:Lcom/vladsch/flexmark/util/format/NumberFormat;


# direct methods
.method static constructor <clinit>()V
    .locals 11

    .line 4
    new-instance v0, Lcom/vladsch/flexmark/util/format/NumberFormat;

    const-string v1, "NONE"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/format/NumberFormat;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/vladsch/flexmark/util/format/NumberFormat;->NONE:Lcom/vladsch/flexmark/util/format/NumberFormat;

    .line 5
    new-instance v1, Lcom/vladsch/flexmark/util/format/NumberFormat;

    const-string v3, "ARABIC"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4}, Lcom/vladsch/flexmark/util/format/NumberFormat;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/vladsch/flexmark/util/format/NumberFormat;->ARABIC:Lcom/vladsch/flexmark/util/format/NumberFormat;

    .line 6
    new-instance v3, Lcom/vladsch/flexmark/util/format/NumberFormat;

    const-string v5, "LETTERS"

    const/4 v6, 0x2

    invoke-direct {v3, v5, v6}, Lcom/vladsch/flexmark/util/format/NumberFormat;-><init>(Ljava/lang/String;I)V

    sput-object v3, Lcom/vladsch/flexmark/util/format/NumberFormat;->LETTERS:Lcom/vladsch/flexmark/util/format/NumberFormat;

    .line 7
    new-instance v5, Lcom/vladsch/flexmark/util/format/NumberFormat;

    const-string v7, "ROMAN"

    const/4 v8, 0x3

    invoke-direct {v5, v7, v8}, Lcom/vladsch/flexmark/util/format/NumberFormat;-><init>(Ljava/lang/String;I)V

    sput-object v5, Lcom/vladsch/flexmark/util/format/NumberFormat;->ROMAN:Lcom/vladsch/flexmark/util/format/NumberFormat;

    .line 8
    new-instance v7, Lcom/vladsch/flexmark/util/format/NumberFormat;

    const-string v9, "CUSTOM"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10}, Lcom/vladsch/flexmark/util/format/NumberFormat;-><init>(Ljava/lang/String;I)V

    sput-object v7, Lcom/vladsch/flexmark/util/format/NumberFormat;->CUSTOM:Lcom/vladsch/flexmark/util/format/NumberFormat;

    const/4 v9, 0x5

    .line 3
    new-array v9, v9, [Lcom/vladsch/flexmark/util/format/NumberFormat;

    aput-object v0, v9, v2

    aput-object v1, v9, v4

    aput-object v3, v9, v6

    aput-object v5, v9, v8

    aput-object v7, v9, v10

    sput-object v9, Lcom/vladsch/flexmark/util/format/NumberFormat;->$VALUES:[Lcom/vladsch/flexmark/util/format/NumberFormat;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 3
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static getFormat(ILjava/lang/CharSequence;)Ljava/lang/String;
    .locals 4

    .line 28
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 29
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    .line 31
    :goto_0
    div-int v2, p0, v1

    mul-int v3, v2, v1

    sub-int/2addr p0, v3

    .line 33
    invoke-interface {p1, p0}, Ljava/lang/CharSequence;->charAt(I)C

    move-result p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    if-gtz v2, :cond_1

    .line 37
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result p0

    .line 38
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1, p0}, Ljava/lang/StringBuilder;-><init>(I)V

    :goto_1
    add-int/lit8 v1, p0, -0x1

    if-lez p0, :cond_0

    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->charAt(I)C

    move-result p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move p0, v1

    goto :goto_1

    .line 43
    :cond_0
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_1
    move p0, v2

    goto :goto_0
.end method

.method public static getFormat(Lcom/vladsch/flexmark/util/format/NumberFormat;I)Ljava/lang/String;
    .locals 2

    .line 11
    sget-object v0, Lcom/vladsch/flexmark/util/format/NumberFormat$1;->$SwitchMap$com$vladsch$flexmark$util$format$NumberFormat:[I

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/format/NumberFormat;->ordinal()I

    move-result p0

    aget p0, v0, p0

    const/4 v0, 0x2

    if-eq p0, v0, :cond_4

    const/4 v0, 0x3

    if-eq p0, v0, :cond_2

    const/4 v0, 0x4

    if-eq p0, v0, :cond_1

    const/4 p1, 0x5

    if-eq p0, p1, :cond_0

    .line 24
    const-string p0, ""

    return-object p0

    .line 22
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "CounterFormat.CUSTOM has to use custom conversion, possibly by calling getFormat(int count, CharSequence digitSet)"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 20
    :cond_1
    new-instance p0, Lcom/vladsch/flexmark/util/format/RomanNumeral;

    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/format/RomanNumeral;-><init>(I)V

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/format/RomanNumeral;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_2
    const/4 p0, 0x1

    if-lt p1, p0, :cond_3

    sub-int/2addr p1, p0

    .line 18
    const-string p0, "abcdefghijklmnopqrstuvwxyz"

    invoke-static {p1, p0}, Lcom/vladsch/flexmark/util/format/NumberFormat;->getFormat(ILjava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 17
    :cond_3
    new-instance p0, Ljava/lang/NumberFormatException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Letter format count must be > 0, actual "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 15
    :cond_4
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/vladsch/flexmark/util/format/NumberFormat;
    .locals 1

    .line 3
    const-class v0, Lcom/vladsch/flexmark/util/format/NumberFormat;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/vladsch/flexmark/util/format/NumberFormat;

    return-object p0
.end method

.method public static values()[Lcom/vladsch/flexmark/util/format/NumberFormat;
    .locals 1

    .line 3
    sget-object v0, Lcom/vladsch/flexmark/util/format/NumberFormat;->$VALUES:[Lcom/vladsch/flexmark/util/format/NumberFormat;

    invoke-virtual {v0}, [Lcom/vladsch/flexmark/util/format/NumberFormat;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/vladsch/flexmark/util/format/NumberFormat;

    return-object v0
.end method
