.class abstract Lcom/flyersoft/components/androidsvg/utils/SVGBase$GraphicsElement;
.super Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditionalElement;
.source "SVGBase.java"

# interfaces
.implements Lcom/flyersoft/components/androidsvg/utils/SVGBase$HasTransform;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/utils/SVGBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "GraphicsElement"
.end annotation


# instance fields
.field transform:Landroid/graphics/Matrix;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 1553
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditionalElement;-><init>()V

    return-void
.end method


# virtual methods
.method public setTransform(Landroid/graphics/Matrix;)V
    .locals 0

    .line 1558
    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$GraphicsElement;->transform:Landroid/graphics/Matrix;

    return-void
.end method
