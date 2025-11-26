.class public Lcom/flyersoft/components/androidsvg/utils/SVGBase$Svg;
.super Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgViewBoxContainer;
.source "SVGBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/utils/SVGBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Svg"
.end annotation


# instance fields
.field height:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

.field public version:Ljava/lang/String;

.field width:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

.field x:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

.field y:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1511
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgViewBoxContainer;-><init>()V

    return-void
.end method


# virtual methods
.method getNodeName()Ljava/lang/String;
    .locals 1

    .line 1520
    const-string v0, "svg"

    return-object v0
.end method
