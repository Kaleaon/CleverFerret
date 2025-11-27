.class Lcom/flyersoft/components/androidsvg/utils/SVGBase$Line;
.super Lcom/flyersoft/components/androidsvg/utils/SVGBase$GraphicsElement;
.source "SVGBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/utils/SVGBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Line"
.end annotation


# instance fields
.field x1:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

.field x2:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

.field y1:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

.field y2:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 1632
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$GraphicsElement;-><init>()V

    return-void
.end method


# virtual methods
.method getNodeName()Ljava/lang/String;
    .locals 1

    .line 1640
    const-string v0, "line"

    return-object v0
.end method
