.class Lcom/flyersoft/views/RulerView$18;
.super Ljava/lang/Object;
.source "RulerView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/views/RulerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 815
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 15

    .line 818
    sget v0, Lcom/flyersoft/views/RulerView;->rulerImageRes:I

    .line 819
    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-static {v1}, Lcom/flyersoft/tools/T;->string2Int(Ljava/lang/String;)I

    move-result v1

    sput v1, Lcom/flyersoft/views/RulerView;->rulerImageRes:I

    .line 820
    invoke-static {}, Lcom/flyersoft/views/RulerView;->-$$Nest$smsetRulerSelect()V

    .line 822
    sget v1, Lcom/flyersoft/views/RulerView;->rulerImageRes:I

    const/4 v2, 0x3

    if-ge v1, v2, :cond_0

    if-lt v0, v2, :cond_0

    .line 823
    invoke-static {}, Lcom/flyersoft/views/RulerView;->-$$Nest$smresetRulerImageHeight()V

    .line 824
    :cond_0
    sget v1, Lcom/flyersoft/views/RulerView;->rulerImageRes:I

    const/4 v3, 0x6

    if-lt v1, v2, :cond_1

    sget v1, Lcom/flyersoft/views/RulerView;->rulerImageRes:I

    if-ge v1, v3, :cond_1

    if-ge v0, v2, :cond_1

    .line 825
    invoke-static {}, Lcom/flyersoft/views/RulerView;->-$$Nest$smresetRulerImageHeight()V

    :cond_1
    const/4 v0, 0x1

    .line 827
    sput-boolean v0, Lcom/flyersoft/views/RulerView;->rulerUseImage:Z

    .line 828
    invoke-static {}, Lcom/flyersoft/views/RulerView;->-$$Nest$smshowRulerSample()V

    .line 830
    sget v1, Lcom/flyersoft/views/RulerView;->rulerImageRes:I

    if-ne v1, v3, :cond_2

    .line 838
    new-instance v4, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v5

    new-instance v6, Lcom/flyersoft/views/RulerView$18$1;

    invoke-direct {v6, p0}, Lcom/flyersoft/views/RulerView$18$1;-><init>(Lcom/flyersoft/views/RulerView$18;)V

    .line 846
    invoke-static {v0}, Lcom/flyersoft/tools/A;->getBackgroundImages(Z)Ljava/util/ArrayList;

    move-result-object v7

    sget-object v9, Lcom/flyersoft/tools/A;->outerImagesFolder:Ljava/lang/String;

    const/high16 v0, 0x42b40000    # 90.0f

    invoke-static {v0}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v11

    const/high16 v0, 0x428c0000    # 70.0f

    invoke-static {v0}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v12

    sget v0, Lcom/flyersoft/moonreaderp/R$string;->background_image:I

    .line 847
    invoke-static {v0}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object v13

    sget-object v14, Lcom/flyersoft/views/RulerView;->custRulerImage:Ljava/lang/String;

    const/4 v8, 0x0

    const/4 v10, 0x1

    invoke-direct/range {v4 .. v14}, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;-><init>(Landroid/content/Context;Lcom/flyersoft/moonreaderp/PrefImageBrowser1$OnSaveImage;Ljava/util/ArrayList;ZLjava/lang/String;IIILjava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v4}, Lcom/flyersoft/moonreaderp/PrefImageBrowser1;->show()V

    :cond_2
    return-void
.end method
