.class final enum Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientSpread;
.super Ljava/lang/Enum;
.source "SVGBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/utils/SVGBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4018
    name = "GradientSpread"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientSpread;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientSpread;

.field public static final enum pad:Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientSpread;

.field public static final enum reflect:Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientSpread;

.field public static final enum repeat:Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientSpread;


# direct methods
.method private static synthetic $values()[Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientSpread;
    .locals 3

    const/4 v0, 0x3

    .line 131
    new-array v0, v0, [Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientSpread;

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientSpread;->pad:Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientSpread;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientSpread;->reflect:Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientSpread;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientSpread;->repeat:Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientSpread;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 134
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientSpread;

    const-string v1, "pad"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientSpread;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientSpread;->pad:Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientSpread;

    .line 135
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientSpread;

    const-string v1, "reflect"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientSpread;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientSpread;->reflect:Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientSpread;

    .line 136
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientSpread;

    const-string v1, "repeat"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientSpread;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientSpread;->repeat:Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientSpread;

    .line 131
    invoke-static {}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientSpread;->$values()[Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientSpread;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientSpread;->$VALUES:[Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientSpread;

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

    .line 132
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientSpread;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8000
        }
        names = {
            null
        }
    .end annotation

    .line 131
    const-class v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientSpread;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientSpread;

    return-object p0
.end method

.method public static values()[Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientSpread;
    .locals 1

    .line 131
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientSpread;->$VALUES:[Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientSpread;

    invoke-virtual {v0}, [Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientSpread;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/flyersoft/components/androidsvg/utils/SVGBase$GradientSpread;

    return-object v0
.end method
