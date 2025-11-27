.class Lcom/flyersoft/components/androidsvg/utils/SVGBase$Rect;
.super Lcom/flyersoft/components/androidsvg/utils/SVGBase$GraphicsElement;
.source "SVGBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/utils/SVGBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Rect"
.end annotation


# instance fields
.field height:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

.field rx:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

.field ry:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

.field width:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

.field x:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

.field y:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 1595
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$GraphicsElement;-><init>()V

    return-void
.end method


# virtual methods
.method getNodeName()Ljava/lang/String;
    .locals 1

    .line 1605
    const-string v0, "rect"

    return-object v0
.end method
