.class abstract Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextPositionedContainer;
.super Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextContainer;
.source "SVGBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/utils/SVGBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "TextPositionedContainer"
.end annotation


# instance fields
.field dx:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;",
            ">;"
        }
    .end annotation
.end field

.field dy:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;",
            ">;"
        }
    .end annotation
.end field

.field x:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;",
            ">;"
        }
    .end annotation
.end field

.field y:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .locals 0

    .line 1686
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextContainer;-><init>()V

    return-void
.end method
