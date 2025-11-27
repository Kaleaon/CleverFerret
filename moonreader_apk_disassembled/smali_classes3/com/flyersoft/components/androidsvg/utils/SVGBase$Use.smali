.class Lcom/flyersoft/components/androidsvg/utils/SVGBase$Use;
.super Lcom/flyersoft/components/androidsvg/utils/SVGBase$Group;
.source "SVGBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/utils/SVGBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Use"
.end annotation


# instance fields
.field height:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

.field href:Ljava/lang/String;

.field width:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

.field x:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;

.field y:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Length;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 1572
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Group;-><init>()V

    return-void
.end method


# virtual methods
.method getNodeName()Ljava/lang/String;
    .locals 1

    .line 1581
    const-string v0, "use"

    return-object v0
.end method
