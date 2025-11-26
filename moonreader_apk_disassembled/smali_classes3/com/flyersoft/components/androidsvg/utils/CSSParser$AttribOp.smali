.class final enum Lcom/flyersoft/components/androidsvg/utils/CSSParser$AttribOp;
.super Ljava/lang/Enum;
.source "CSSParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/utils/CSSParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "AttribOp"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/flyersoft/components/androidsvg/utils/CSSParser$AttribOp;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/flyersoft/components/androidsvg/utils/CSSParser$AttribOp;

.field public static final enum DASHMATCH:Lcom/flyersoft/components/androidsvg/utils/CSSParser$AttribOp;

.field public static final enum EQUALS:Lcom/flyersoft/components/androidsvg/utils/CSSParser$AttribOp;

.field public static final enum EXISTS:Lcom/flyersoft/components/androidsvg/utils/CSSParser$AttribOp;

.field public static final enum INCLUDES:Lcom/flyersoft/components/androidsvg/utils/CSSParser$AttribOp;


# direct methods
.method private static synthetic $values()[Lcom/flyersoft/components/androidsvg/utils/CSSParser$AttribOp;
    .locals 3

    const/4 v0, 0x4

    .line 82
    new-array v0, v0, [Lcom/flyersoft/components/androidsvg/utils/CSSParser$AttribOp;

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$AttribOp;->EXISTS:Lcom/flyersoft/components/androidsvg/utils/CSSParser$AttribOp;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$AttribOp;->EQUALS:Lcom/flyersoft/components/androidsvg/utils/CSSParser$AttribOp;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$AttribOp;->INCLUDES:Lcom/flyersoft/components/androidsvg/utils/CSSParser$AttribOp;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/CSSParser$AttribOp;->DASHMATCH:Lcom/flyersoft/components/androidsvg/utils/CSSParser$AttribOp;

    const/4 v2, 0x3

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 84
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$AttribOp;

    const-string v1, "EXISTS"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$AttribOp;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$AttribOp;->EXISTS:Lcom/flyersoft/components/androidsvg/utils/CSSParser$AttribOp;

    .line 85
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$AttribOp;

    const-string v1, "EQUALS"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$AttribOp;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$AttribOp;->EQUALS:Lcom/flyersoft/components/androidsvg/utils/CSSParser$AttribOp;

    .line 86
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$AttribOp;

    const-string v1, "INCLUDES"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$AttribOp;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$AttribOp;->INCLUDES:Lcom/flyersoft/components/androidsvg/utils/CSSParser$AttribOp;

    .line 87
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$AttribOp;

    const-string v1, "DASHMATCH"

    const/4 v2, 0x3

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$AttribOp;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$AttribOp;->DASHMATCH:Lcom/flyersoft/components/androidsvg/utils/CSSParser$AttribOp;

    .line 82
    invoke-static {}, Lcom/flyersoft/components/androidsvg/utils/CSSParser$AttribOp;->$values()[Lcom/flyersoft/components/androidsvg/utils/CSSParser$AttribOp;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$AttribOp;->$VALUES:[Lcom/flyersoft/components/androidsvg/utils/CSSParser$AttribOp;

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

    .line 82
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/CSSParser$AttribOp;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8000
        }
        names = {
            null
        }
    .end annotation

    .line 82
    const-class v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$AttribOp;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$AttribOp;

    return-object p0
.end method

.method public static values()[Lcom/flyersoft/components/androidsvg/utils/CSSParser$AttribOp;
    .locals 1

    .line 82
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/CSSParser$AttribOp;->$VALUES:[Lcom/flyersoft/components/androidsvg/utils/CSSParser$AttribOp;

    invoke-virtual {v0}, [Lcom/flyersoft/components/androidsvg/utils/CSSParser$AttribOp;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/flyersoft/components/androidsvg/utils/CSSParser$AttribOp;

    return-object v0
.end method
