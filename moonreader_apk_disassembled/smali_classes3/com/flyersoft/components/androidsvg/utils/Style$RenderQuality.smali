.class public final enum Lcom/flyersoft/components/androidsvg/utils/Style$RenderQuality;
.super Ljava/lang/Enum;
.source "Style.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/utils/Style;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "RenderQuality"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/flyersoft/components/androidsvg/utils/Style$RenderQuality;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/flyersoft/components/androidsvg/utils/Style$RenderQuality;

.field public static final enum auto:Lcom/flyersoft/components/androidsvg/utils/Style$RenderQuality;

.field public static final enum optimizeQuality:Lcom/flyersoft/components/androidsvg/utils/Style$RenderQuality;

.field public static final enum optimizeSpeed:Lcom/flyersoft/components/androidsvg/utils/Style$RenderQuality;


# direct methods
.method private static synthetic $values()[Lcom/flyersoft/components/androidsvg/utils/Style$RenderQuality;
    .locals 3

    const/4 v0, 0x3

    .line 235
    new-array v0, v0, [Lcom/flyersoft/components/androidsvg/utils/Style$RenderQuality;

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$RenderQuality;->auto:Lcom/flyersoft/components/androidsvg/utils/Style$RenderQuality;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$RenderQuality;->optimizeQuality:Lcom/flyersoft/components/androidsvg/utils/Style$RenderQuality;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    sget-object v1, Lcom/flyersoft/components/androidsvg/utils/Style$RenderQuality;->optimizeSpeed:Lcom/flyersoft/components/androidsvg/utils/Style$RenderQuality;

    const/4 v2, 0x2

    aput-object v1, v0, v2

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 3

    .line 237
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/Style$RenderQuality;

    const-string v1, "auto"

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/Style$RenderQuality;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/Style$RenderQuality;->auto:Lcom/flyersoft/components/androidsvg/utils/Style$RenderQuality;

    .line 238
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/Style$RenderQuality;

    const-string v1, "optimizeQuality"

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/Style$RenderQuality;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/Style$RenderQuality;->optimizeQuality:Lcom/flyersoft/components/androidsvg/utils/Style$RenderQuality;

    .line 239
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/Style$RenderQuality;

    const-string v1, "optimizeSpeed"

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/Style$RenderQuality;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/Style$RenderQuality;->optimizeSpeed:Lcom/flyersoft/components/androidsvg/utils/Style$RenderQuality;

    .line 235
    invoke-static {}, Lcom/flyersoft/components/androidsvg/utils/Style$RenderQuality;->$values()[Lcom/flyersoft/components/androidsvg/utils/Style$RenderQuality;

    move-result-object v0

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/Style$RenderQuality;->$VALUES:[Lcom/flyersoft/components/androidsvg/utils/Style$RenderQuality;

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

    .line 235
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/flyersoft/components/androidsvg/utils/Style$RenderQuality;
    .locals 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8000
        }
        names = {
            null
        }
    .end annotation

    .line 235
    const-class v0, Lcom/flyersoft/components/androidsvg/utils/Style$RenderQuality;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/flyersoft/components/androidsvg/utils/Style$RenderQuality;

    return-object p0
.end method

.method public static values()[Lcom/flyersoft/components/androidsvg/utils/Style$RenderQuality;
    .locals 1

    .line 235
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/Style$RenderQuality;->$VALUES:[Lcom/flyersoft/components/androidsvg/utils/Style$RenderQuality;

    invoke-virtual {v0}, [Lcom/flyersoft/components/androidsvg/utils/Style$RenderQuality;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/flyersoft/components/androidsvg/utils/Style$RenderQuality;

    return-object v0
.end method
