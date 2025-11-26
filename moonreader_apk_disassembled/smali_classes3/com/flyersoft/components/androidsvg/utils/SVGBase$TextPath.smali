.class Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextPath;
.super Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextContainer;
.source "SVGBase.java"

# interfaces
.implements Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextChild;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/utils/SVGBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "TextPath"
.end annotation


# instance fields
.field href:Ljava/lang/String;

.field startOffset:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

.field private textRoot:Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextRoot;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 1757
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextContainer;-><init>()V

    return-void
.end method


# virtual methods
.method getNodeName()Ljava/lang/String;
    .locals 1

    .line 1769
    const-string v0, "textPath"

    return-object v0
.end method

.method public getTextRoot()Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextRoot;
    .locals 1

    .line 1767
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextPath;->textRoot:Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextRoot;

    return-object v0
.end method

.method public setTextRoot(Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextRoot;)V
    .locals 0

    .line 1765
    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextPath;->textRoot:Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextRoot;

    return-void
.end method
