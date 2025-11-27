.class Lcom/flyersoft/components/androidsvg/utils/SVGBase$ClipPath;
.super Lcom/flyersoft/components/androidsvg/utils/SVGBase$Group;
.source "SVGBase.java"

# interfaces
.implements Lcom/flyersoft/components/androidsvg/utils/SVGBase$NotDirectlyRendered;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/utils/SVGBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ClipPath"
.end annotation


# static fields
.field static final NODE_NAME:Ljava/lang/String; = "clipPath"


# instance fields
.field clipPathUnitsAreUser:Ljava/lang/Boolean;


# direct methods
.method constructor <init>()V
    .locals 0

    .line 1869
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Group;-><init>()V

    return-void
.end method


# virtual methods
.method getNodeName()Ljava/lang/String;
    .locals 1

    .line 1876
    const-string v0, "clipPath"

    return-object v0
.end method
