.class Lcom/flyersoft/components/androidsvg/utils/SVGBase$PaintReference;
.super Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;
.source "SVGBase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/utils/SVGBase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "PaintReference"
.end annotation


# instance fields
.field final fallback:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;

.field final href:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;)V
    .locals 0

    .line 1190
    invoke-direct {p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;-><init>()V

    .line 1191
    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PaintReference;->href:Ljava/lang/String;

    .line 1192
    iput-object p2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PaintReference;->fallback:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;

    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    .line 1197
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PaintReference;->href:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PaintReference;->fallback:Lcom/flyersoft/components/androidsvg/utils/SVGBase$SvgPaint;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
