.class abstract Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$TextProcessor;
.super Ljava/lang/Object;
.source "SVGAndroidRenderer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x40a
    name = "TextProcessor"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 1647
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer-IA;)V
    .locals 0

    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$TextProcessor;-><init>()V

    return-void
.end method


# virtual methods
.method public doTextContainer(Lcom/flyersoft/components/androidsvg/utils/SVGBase$TextContainer;)Z
    .locals 0

    const/4 p1, 0x1

    return p1
.end method

.method public abstract processText(Ljava/lang/String;)V
.end method
