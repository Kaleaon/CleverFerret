.class Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerPositionCalculator;
.super Ljava/lang/Object;
.source "SVGAndroidRenderer.java"

# interfaces
.implements Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathInterface;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MarkerPositionCalculator"
.end annotation


# instance fields
.field private closepathReAdjustPending:Z

.field private lastPos:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;

.field private final markers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;",
            ">;"
        }
    .end annotation
.end field

.field private normalCubic:Z

.field private startArc:Z

.field private startX:F

.field private startY:F

.field private subpathStartIndex:I

.field final synthetic this$0:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;)V
    .locals 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010,
            0x0
        }
        names = {
            null,
            null
        }
    .end annotation

    .line 3144
    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerPositionCalculator;->this$0:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3134
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerPositionCalculator;->markers:Ljava/util/List;

    const/4 v0, 0x0

    .line 3137
    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerPositionCalculator;->lastPos:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;

    const/4 v0, 0x0

    .line 3138
    iput-boolean v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerPositionCalculator;->startArc:Z

    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerPositionCalculator;->normalCubic:Z

    const/4 v1, -0x1

    .line 3139
    iput v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerPositionCalculator;->subpathStartIndex:I

    if-nez p2, :cond_0

    goto :goto_0

    .line 3149
    :cond_0
    invoke-virtual {p2, p0}, Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathDefinition;->enumeratePath(Lcom/flyersoft/components/androidsvg/utils/SVGBase$PathInterface;)V

    .line 3151
    iget-boolean p2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerPositionCalculator;->closepathReAdjustPending:Z

    if-eqz p2, :cond_1

    .line 3154
    iget-object p2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerPositionCalculator;->lastPos:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;

    iget v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerPositionCalculator;->subpathStartIndex:I

    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;

    invoke-virtual {p2, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->add(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;)V

    .line 3156
    iget p2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerPositionCalculator;->subpathStartIndex:I

    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerPositionCalculator;->lastPos:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;

    invoke-interface {p1, p2, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 3157
    iput-boolean v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerPositionCalculator;->closepathReAdjustPending:Z

    .line 3160
    :cond_1
    iget-object p2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerPositionCalculator;->lastPos:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;

    if-eqz p2, :cond_2

    .line 3161
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_2
    :goto_0
    return-void
.end method


# virtual methods
.method public arcTo(FFFZZFF)V
    .locals 12

    const/4 v10, 0x1

    .line 3224
    iput-boolean v10, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerPositionCalculator;->startArc:Z

    const/4 v11, 0x0

    .line 3225
    iput-boolean v11, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerPositionCalculator;->normalCubic:Z

    .line 3226
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerPositionCalculator;->lastPos:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;

    iget v0, v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->x:F

    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerPositionCalculator;->lastPos:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;

    iget v1, v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->y:F

    move-object v9, p0

    move v2, p1

    move v3, p2

    move v4, p3

    move/from16 v5, p4

    move/from16 v6, p5

    move/from16 v7, p6

    move/from16 v8, p7

    invoke-static/range {v0 .. v9}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer;->-$$Nest$smarcTo(FFFFFZZFFLcom/flyersoft/components/androidsvg/utils/SVGBase$PathInterface;)V

    .line 3227
    iput-boolean v10, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerPositionCalculator;->normalCubic:Z

    .line 3228
    iput-boolean v11, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerPositionCalculator;->closepathReAdjustPending:Z

    return-void
.end method

.method public close()V
    .locals 2

    .line 3234
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerPositionCalculator;->markers:Ljava/util/List;

    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerPositionCalculator;->lastPos:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 3235
    iget v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerPositionCalculator;->startX:F

    iget v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerPositionCalculator;->startY:F

    invoke-virtual {p0, v0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerPositionCalculator;->lineTo(FF)V

    const/4 v0, 0x1

    .line 3240
    iput-boolean v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerPositionCalculator;->closepathReAdjustPending:Z

    return-void
.end method

.method public cubicTo(FFFFFF)V
    .locals 2

    .line 3202
    iget-boolean v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerPositionCalculator;->normalCubic:Z

    const/4 v1, 0x0

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerPositionCalculator;->startArc:Z

    if-eqz v0, :cond_1

    .line 3203
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerPositionCalculator;->lastPos:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;

    invoke-virtual {v0, p1, p2}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->add(FF)V

    .line 3204
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerPositionCalculator;->markers:Ljava/util/List;

    iget-object p2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerPositionCalculator;->lastPos:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 3205
    iput-boolean v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerPositionCalculator;->startArc:Z

    .line 3207
    :cond_1
    new-instance p1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;

    sub-float p2, p5, p3

    sub-float p3, p6, p4

    invoke-direct {p1, p5, p6, p2, p3}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;-><init>(FFFF)V

    iput-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerPositionCalculator;->lastPos:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;

    .line 3208
    iput-boolean v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerPositionCalculator;->closepathReAdjustPending:Z

    return-void
.end method

.method getMarkers()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;",
            ">;"
        }
    .end annotation

    .line 3167
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerPositionCalculator;->markers:Ljava/util/List;

    return-object v0
.end method

.method public lineTo(FF)V
    .locals 3

    .line 3193
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerPositionCalculator;->lastPos:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;

    invoke-virtual {v0, p1, p2}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->add(FF)V

    .line 3194
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerPositionCalculator;->markers:Ljava/util/List;

    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerPositionCalculator;->lastPos:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 3195
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;

    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerPositionCalculator;->lastPos:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;

    iget v1, v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->x:F

    sub-float v1, p1, v1

    iget-object v2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerPositionCalculator;->lastPos:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;

    iget v2, v2, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->y:F

    sub-float v2, p2, v2

    invoke-direct {v0, p1, p2, v1, v2}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;-><init>(FFFF)V

    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerPositionCalculator;->lastPos:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;

    const/4 p1, 0x0

    .line 3196
    iput-boolean p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerPositionCalculator;->closepathReAdjustPending:Z

    return-void
.end method

.method public moveTo(FF)V
    .locals 3

    .line 3173
    iget-boolean v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerPositionCalculator;->closepathReAdjustPending:Z

    if-eqz v0, :cond_0

    .line 3176
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerPositionCalculator;->lastPos:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;

    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerPositionCalculator;->markers:Ljava/util/List;

    iget v2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerPositionCalculator;->subpathStartIndex:I

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;

    invoke-virtual {v0, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->add(Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;)V

    .line 3178
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerPositionCalculator;->markers:Ljava/util/List;

    iget v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerPositionCalculator;->subpathStartIndex:I

    iget-object v2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerPositionCalculator;->lastPos:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;

    invoke-interface {v0, v1, v2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    const/4 v0, 0x0

    .line 3179
    iput-boolean v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerPositionCalculator;->closepathReAdjustPending:Z

    .line 3181
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerPositionCalculator;->lastPos:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;

    if-eqz v0, :cond_1

    .line 3182
    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerPositionCalculator;->markers:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 3184
    :cond_1
    iput p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerPositionCalculator;->startX:F

    .line 3185
    iput p2, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerPositionCalculator;->startY:F

    .line 3186
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;

    const/4 v1, 0x0

    invoke-direct {v0, p1, p2, v1, v1}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;-><init>(FFFF)V

    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerPositionCalculator;->lastPos:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;

    .line 3187
    iget-object p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerPositionCalculator;->markers:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    iput p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerPositionCalculator;->subpathStartIndex:I

    return-void
.end method

.method public quadTo(FFFF)V
    .locals 2

    .line 3214
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerPositionCalculator;->lastPos:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;

    invoke-virtual {v0, p1, p2}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;->add(FF)V

    .line 3215
    iget-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerPositionCalculator;->markers:Ljava/util/List;

    iget-object v1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerPositionCalculator;->lastPos:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 3216
    new-instance v0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;

    sub-float p1, p3, p1

    sub-float p2, p4, p2

    invoke-direct {v0, p3, p4, p1, p2}, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;-><init>(FFFF)V

    iput-object v0, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerPositionCalculator;->lastPos:Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerVector;

    const/4 p1, 0x0

    .line 3217
    iput-boolean p1, p0, Lcom/flyersoft/components/androidsvg/utils/SVGAndroidRenderer$MarkerPositionCalculator;->closepathReAdjustPending:Z

    return-void
.end method
