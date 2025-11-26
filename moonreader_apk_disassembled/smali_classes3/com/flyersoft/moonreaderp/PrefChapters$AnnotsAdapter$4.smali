.class Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4;
.super Ljava/lang/Object;
.source "PrefChapters.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 1503
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 12

    .line 1505
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 1506
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefChapters;->annots:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    .line 1508
    iget v2, v1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->resId:I

    sget v3, Lcom/flyersoft/moonreaderp/R$drawable;->bmnote:I

    const/4 v4, 0x4

    if-ne v2, v3, :cond_0

    const/4 v2, 0x6

    goto :goto_0

    :cond_0
    iget v2, v1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->resId:I

    sget v3, Lcom/flyersoft/moonreaderp/R$drawable;->bmhighlight:I

    if-ne v2, v3, :cond_1

    const/4 v2, 0x5

    goto :goto_0

    :cond_1
    const/4 v2, 0x4

    .line 1509
    :goto_0
    new-array v3, v2, [Ljava/lang/String;

    .line 1510
    iget v5, v1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->resId:I

    sget v6, Lcom/flyersoft/moonreaderp/R$drawable;->bmnote:I

    const/4 v7, 0x3

    const-string v8, " -> Readwise"

    const/4 v9, 0x2

    const/4 v10, 0x0

    const/4 v11, 0x1

    if-ne v5, v6, :cond_2

    .line 1511
    sget v5, Lcom/flyersoft/moonreaderp/R$string;->copy:I

    invoke-static {v5}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v10

    .line 1512
    sget v5, Lcom/flyersoft/moonreaderp/R$string;->share:I

    invoke-static {v5}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v11

    .line 1513
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    sget v6, Lcom/flyersoft/moonreaderp/R$string;->share:I

    invoke-static {v6}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v9

    .line 1514
    iget-object v5, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;

    iget-object v5, v5, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-virtual {v5}, Lcom/flyersoft/moonreaderp/PrefChapters;->getContext()Landroid/content/Context;

    move-result-object v5

    sget v6, Lcom/flyersoft/moonreaderp/R$array;->catalog_popup_menu:I

    invoke-static {v5, v6, v11}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v7

    .line 1515
    iget-object v5, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;

    iget-object v5, v5, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-virtual {v5}, Lcom/flyersoft/moonreaderp/PrefChapters;->getContext()Landroid/content/Context;

    move-result-object v5

    sget v6, Lcom/flyersoft/moonreaderp/R$array;->one_file_bookmark:I

    invoke-static {v5, v6, v11}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    goto :goto_1

    .line 1516
    :cond_2
    iget v4, v1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->resId:I

    sget v5, Lcom/flyersoft/moonreaderp/R$drawable;->bmhighlight:I

    if-ne v4, v5, :cond_3

    .line 1517
    sget v4, Lcom/flyersoft/moonreaderp/R$string;->copy:I

    invoke-static {v4}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v10

    .line 1518
    sget v4, Lcom/flyersoft/moonreaderp/R$string;->share:I

    invoke-static {v4}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v11

    .line 1519
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    sget v5, Lcom/flyersoft/moonreaderp/R$string;->share:I

    invoke-static {v5}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v9

    .line 1520
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-virtual {v4}, Lcom/flyersoft/moonreaderp/PrefChapters;->getContext()Landroid/content/Context;

    move-result-object v4

    sget v5, Lcom/flyersoft/moonreaderp/R$array;->one_file_bookmark:I

    invoke-static {v4, v5, v11}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v7

    goto :goto_1

    .line 1522
    :cond_3
    sget v4, Lcom/flyersoft/moonreaderp/R$string;->copy:I

    invoke-static {v4}, Lcom/flyersoft/tools/A;->getString(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v10

    .line 1523
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-virtual {v4}, Lcom/flyersoft/moonreaderp/PrefChapters;->getContext()Landroid/content/Context;

    move-result-object v4

    sget v5, Lcom/flyersoft/moonreaderp/R$array;->catalog_popup_menu:I

    invoke-static {v4, v5, v11}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v11

    .line 1524
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-virtual {v4}, Lcom/flyersoft/moonreaderp/PrefChapters;->getContext()Landroid/content/Context;

    move-result-object v4

    sget v5, Lcom/flyersoft/moonreaderp/R$array;->one_file_bookmark:I

    invoke-static {v4, v5, v11}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v9

    :goto_1
    sub-int/2addr v2, v11

    .line 1526
    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-virtual {v4}, Lcom/flyersoft/moonreaderp/PrefChapters;->getContext()Landroid/content/Context;

    move-result-object v4

    const v5, 0x104000d

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v2

    .line 1529
    invoke-static {}, Lcom/flyersoft/tools/A;->isCutoutScreen()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 1530
    invoke-static {}, Lcom/flyersoft/tools/A;->isLandscape()Z

    move-result v2

    if-eqz v2, :cond_4

    sget-boolean v2, Lcom/flyersoft/tools/A;->fullscreen:Z

    if-nez v2, :cond_5

    .line 1531
    :cond_4
    invoke-static {}, Lcom/flyersoft/tools/A;->getSysBarHeight()I

    move-result v2

    neg-int v10, v2

    .line 1533
    :cond_5
    new-instance v2, Lcom/flyersoft/components/MyMenu;

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-virtual {v4}, Lcom/flyersoft/moonreaderp/PrefChapters;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v2, v4}, Lcom/flyersoft/components/MyMenu;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, p1}, Lcom/flyersoft/components/MyMenu;->setAnchor(Landroid/view/View;)Lcom/flyersoft/components/MyMenu;

    move-result-object v2

    new-instance v4, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;

    invoke-direct {v4, p0, v1, v3, v0}, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$2;-><init>(Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4;Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;[Ljava/lang/String;I)V

    invoke-virtual {v2, v3, v4}, Lcom/flyersoft/components/MyMenu;->setItems([Ljava/lang/CharSequence;Lcom/flyersoft/components/MyMenu$MenuItemClick;)Lcom/flyersoft/components/MyMenu;

    move-result-object v0

    iget-object v1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/PrefChapters;->root:Landroid/view/View;

    .line 1639
    invoke-virtual {v0, v1}, Lcom/flyersoft/components/MyMenu;->setBuilderAnchor(Landroid/view/View;)Lcom/flyersoft/components/MyMenu;

    move-result-object v0

    new-instance v1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$1;

    invoke-direct {v1, p0}, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4$1;-><init>(Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter$4;)V

    .line 1640
    invoke-virtual {v0, v1}, Lcom/flyersoft/components/MyMenu;->setOnDismissListener(Landroid/widget/PopupWindow$OnDismissListener;)Lcom/flyersoft/components/MyMenu;

    move-result-object v0

    const/4 v1, 0x0

    .line 1647
    invoke-static {v1}, Lcom/flyersoft/components/MyMenu;->getXoffInDialog(Landroid/view/View;)I

    move-result v1

    const/high16 v2, 0x41200000    # 10.0f

    invoke-static {v2}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v2

    sub-int/2addr v10, v2

    invoke-virtual {v0, p1, v1, v10}, Lcom/flyersoft/components/MyMenu;->showOverflow(Landroid/view/View;II)V

    return-void
.end method
