.class Lcom/flyersoft/components/androidsvg/utils/SVGBase$A;
.super Lcom/flyersoft/components/androidsvg/utils/SVGBase$Group;
.source "SVGBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/utils/SVGBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "A"
.end annotation


# instance fields
.field href:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 1563
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Group;-><init>()V

    return-void
.end method


# virtual methods
.method getNodeName()Ljava/lang/String;
    .locals 1

    .line 1568
    const-string v0, "a"

    return-object v0
.end method
