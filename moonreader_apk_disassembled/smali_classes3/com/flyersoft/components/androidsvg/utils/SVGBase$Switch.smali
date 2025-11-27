.class Lcom/flyersoft/components/androidsvg/utils/SVGBase$Switch;
.super Lcom/flyersoft/components/androidsvg/utils/SVGBase$Group;
.source "SVGBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/utils/SVGBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Switch"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 1774
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Group;-><init>()V

    return-void
.end method


# virtual methods
.method getNodeName()Ljava/lang/String;
    .locals 1

    .line 1777
    const-string v0, "switch"

    return-object v0
.end method
