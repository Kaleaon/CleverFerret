.class public Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgObject;
.super Ljava/lang/Object;
.source "SVGBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/utils/SVGBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SvgObject"
.end annotation


# instance fields
.field document:Lcom/flyersoft/components/androidsvg/utils/SVGBase;

.field parent:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgContainer;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1365
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method getNodeName()Ljava/lang/String;
    .locals 1

    .line 1372
    const-string v0, ""

    return-object v0
.end method
