.class public Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextSequence;
.super Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;
.source "SVGBase.java"

# interfaces
.implements Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextChild;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/utils/SVGBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TextSequence"
.end annotation


# instance fields
.field text:Ljava/lang/String;

.field private textRoot:Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextRoot;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1726
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;-><init>()V

    .line 1727
    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextSequence;->text:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getTextRoot()Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextRoot;
    .locals 1

    .line 1738
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextSequence;->textRoot:Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextRoot;

    return-object v0
.end method

.method public setTextRoot(Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextRoot;)V
    .locals 0

    .line 1736
    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextSequence;->textRoot:Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextRoot;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1732
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "TextChild: \'"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextSequence;->text:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
