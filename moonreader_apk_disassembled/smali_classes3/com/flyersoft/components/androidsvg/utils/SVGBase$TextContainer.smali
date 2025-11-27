.class public abstract Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextContainer;
.super Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditionalContainer;
.source "SVGBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/utils/SVGBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "TextContainer"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1673
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgConditionalContainer;-><init>()V

    return-void
.end method


# virtual methods
.method public addChild(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation

    .line 1678
    instance-of v0, p1, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextChild;

    if-eqz v0, :cond_0

    .line 1679
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextContainer;->children:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void

    .line 1681
    :cond_0
    new-instance v0, Lcom/flyersoft/components/androidsvg/SVGParseException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Text content elements cannot contain "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, " elements."

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/flyersoft/components/androidsvg/SVGParseException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
