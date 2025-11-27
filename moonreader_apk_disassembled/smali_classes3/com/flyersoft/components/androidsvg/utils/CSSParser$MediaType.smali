.class final enum Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;
.super Ljava/lang/Enum;
.source "CSSParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/utils/CSSParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "MediaType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;

.field public static final enum all:Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;

.field public static final enum aural:Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;

.field public static final enum braille:Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;

.field public static final enum embossed:Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;

.field public static final enum handheld:Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;

.field public static final enum print:Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;

.field public static final enum projection:Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;

.field public static final enum screen:Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;

.field public static final enum speech:Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;

.field public static final enum tty:Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;

.field public static final enum tv:Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;


# direct methods
.method private static synthetic $values()[Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;
    .locals 3

    const/16 v0, 0xb

    .line 59
    new-array v0, v0, [Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;->all:Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;->aural:Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;->braille:Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;->embossed:Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;

    const/4 v2, 0x3

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;->handheld:Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;

    const/4 v2, 0x4

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;->print:Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;

    const/4 v2, 0x5

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;->projection:Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;

    const/4 v2, 0x6

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;->screen:Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;

    const/4 v2, 0x7

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;->speech:Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;

    const/16 v2, 0x8

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;->tty:Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;

    const/16 v2, 0x9

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;->tv:Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;

    const/16 v2, 0xa

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 62
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;

    const-string v1, "all"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;->all:Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;

    .line 63
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;

    const-string v1, "aural"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;->aural:Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;

    .line 64
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;

    const-string v1, "braille"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;->braille:Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;

    .line 65
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;

    const-string v1, "embossed"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;->embossed:Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;

    .line 66
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;

    const-string v1, "handheld"

    const/4 v2, 0x4

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;->handheld:Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;

    .line 67
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;

    const-string v1, "print"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;->print:Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;

    .line 68
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;

    const-string v1, "projection"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;->projection:Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;

    .line 69
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;

    const-string v1, "screen"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;->screen:Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;

    .line 70
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;

    const-string v1, "speech"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;->speech:Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;

    .line 71
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;

    const-string v1, "tty"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;->tty:Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;

    .line 72
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;

    const-string v1, "tv"

    const/16 v2, 0xa

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;->tv:Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;

    .line 59
    invoke-static {}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;->$values()[Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;->$VALUES:[Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 60
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8000
        }
        names = {
            null
        }
    .end annotation

    .line 59
    const-class v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;

    return-object p0
.end method

.method public static values()[Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;
    .locals 1

    .line 59
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;->$VALUES:[Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;

    invoke-virtual {v0}, [Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/flyersoft/components/androidsvg/utils/CSSParser$MediaType;

    return-object v0
.end method
