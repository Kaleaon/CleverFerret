.class public Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;
.super Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;
.source "SVGBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/utils/SVGBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Colour"
.end annotation


# static fields
.field static final BLACK:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;

.field static final TRANSPARENT:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;


# instance fields
.field final colour:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1153
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;

    const/high16 v1, -0x1000000

    invoke-direct {v0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;-><init>(I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;->BLACK:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;

    .line 1154
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;-><init>(I)V

    sput-object v0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;->TRANSPARENT:Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;

    return-void
.end method

.method constructor <init>(I)V
    .locals 0

    .line 1157
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;-><init>()V

    .line 1158
    iput p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;->colour:I

    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 3

    .line 1163
    iget v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$Colour;->colour:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object v0, v1, v2

    const-string v0, "#%08x"

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
