.class public Lcom/flyersoft/components/androidsvg/utils/SVGBase$CSSClipRect;
.super Ljava/lang/Object;
.source "SVGBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/utils/SVGBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CSSClipRect"
.end annotation


# instance fields
.field final bottom:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

.field final left:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

.field final right:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

.field final top:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;)V
    .locals 0

    .line 1350
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1351
    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$CSSClipRect;->top:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    .line 1352
    iput-object p2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$CSSClipRect;->right:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    .line 1353
    iput-object p3, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$CSSClipRect;->bottom:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    .line 1354
    iput-object p4, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$CSSClipRect;->left:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

    return-void
.end method
