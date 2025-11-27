.class Lcom/flyersoft/components/androidsvg/utils/SVGBase$CurrentColor;
.super Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;
.source "SVGBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/utils/SVGBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "CurrentColor"
.end annotation


# static fields
.field private static final instance:Lcom/flyersoft/components/androidsvg/utils/SVGBase$CurrentColor;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1171
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$CurrentColor;

    invoke-direct {v0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$CurrentColor;-><init>()V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$CurrentColor;->instance:Lcom/flyersoft/components/androidsvg/utils/SVGBase$CurrentColor;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1174
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;-><init>()V

    return-void
.end method

.method static getInstance()Lcom/flyersoft/components/androidsvg/utils/SVGBase$CurrentColor;
    .locals 1

    .line 1179
    sget-object v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$CurrentColor;->instance:Lcom/flyersoft/components/androidsvg/utils/SVGBase$CurrentColor;

    return-object v0
.end method
