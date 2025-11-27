.class Lcom/flyersoft/components/androidsvg/utils/SVGBase$TRef;
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
    name = "TRef"
.end annotation


# instance fields
.field href:Ljava/lang/String;

.field private textRoot:Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextRoot;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 1742
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextContainer;-><init>()V

    return-void
.end method


# virtual methods
.method getNodeName()Ljava/lang/String;
    .locals 1

    .line 1753
    const-string v0, "tref"

    return-object v0
.end method

.method public getTextRoot()Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextRoot;
    .locals 1

    .line 1751
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TRef;->textRoot:Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextRoot;

    return-object v0
.end method

.method public setTextRoot(Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextRoot;)V
    .locals 0

    .line 1749
    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TRef;->textRoot:Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextRoot;

    return-void
.end method
