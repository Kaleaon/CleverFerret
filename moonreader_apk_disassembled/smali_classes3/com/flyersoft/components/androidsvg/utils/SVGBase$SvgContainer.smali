.class public interface abstract Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;
.super Ljava/lang/Object;
.source "SVGBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/utils/SVGBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "SvgContainer"
.end annotation


# virtual methods
.method public abstract addChild(Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/flyersoft/components/androidsvg/SVGParseException;
        }
    .end annotation
.end method

.method public abstract getChildren()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;",
            ">;"
        }
    .end annotation
.end method
