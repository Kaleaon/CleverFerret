.class Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 12899
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 9

    .line 12901
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 12902
    iget-object v1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v1, v1, Lcom/flyersoft/moonreaderp/ActivityMain;->annots:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;

    .line 12904
    iget v2, v1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->resId:I

    sget v3, Lcom/flyersoft/moonreaderp/R$drawable;->bmnote:I

    const/4 v4, 0x3

    if-ne v2, v3, :cond_0

    const/4 v2, 0x4

    goto :goto_0

    :cond_0
    const/4 v2, 0x3

    :goto_0
    new-array v2, v2, [Ljava/lang/String;

    .line 12905
    iget v3, v1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->resId:I

    sget v5, Lcom/flyersoft/moonreaderp/R$drawable;->bmnote:I

    const/4 v6, 0x2

    const/4 v7, 0x0

    const/4 v8, 0x1

    if-ne v3, v5, :cond_1

    .line 12906
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v5, Lcom/flyersoft/moonreaderp/R$string;->copy:I

    invoke-virtual {v3, v5}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v7

    .line 12907
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v5, Lcom/flyersoft/moonreaderp/R$string;->share:I

    invoke-virtual {v3, v5}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v8

    .line 12908
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v5, Lcom/flyersoft/moonreaderp/R$array;->catalog_popup_menu:I

    invoke-static {v3, v5, v8}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v6

    .line 12909
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v5, Lcom/flyersoft/moonreaderp/R$array;->one_file_bookmark:I

    invoke-static {v3, v5, v8}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v4

    goto :goto_1

    .line 12910
    :cond_1
    iget v3, v1, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;->resId:I

    sget v4, Lcom/flyersoft/moonreaderp/R$drawable;->bmhighlight:I

    if-ne v3, v4, :cond_2

    .line 12911
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v4, Lcom/flyersoft/moonreaderp/R$string;->copy:I

    invoke-virtual {v3, v4}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v7

    .line 12912
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v4, Lcom/flyersoft/moonreaderp/R$string;->share:I

    invoke-virtual {v3, v4}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v8

    .line 12913
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v4, Lcom/flyersoft/moonreaderp/R$array;->one_file_bookmark:I

    invoke-static {v3, v4, v8}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v6

    goto :goto_1

    .line 12915
    :cond_2
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v4, Lcom/flyersoft/moonreaderp/R$string;->copy:I

    invoke-virtual {v3, v4}, Lcom/flyersoft/moonreaderp/ActivityMain;->getString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v7

    .line 12916
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v4, Lcom/flyersoft/moonreaderp/R$array;->catalog_popup_menu:I

    invoke-static {v3, v4, v8}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v8

    .line 12917
    iget-object v3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;

    iget-object v3, v3, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v4, Lcom/flyersoft/moonreaderp/R$array;->one_file_bookmark:I

    invoke-static {v3, v4, v8}, Lcom/flyersoft/tools/A;->getStringArrayItem(Landroid/content/Context;II)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v6

    .line 12920
    :goto_1
    new-instance v3, Lcom/flyersoft/components/MyMenu;

    iget-object v4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4;->this$1:Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;

    iget-object v4, v4, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-direct {v3, v4}, Lcom/flyersoft/components/MyMenu;-><init>(Landroid/content/Context;)V

    invoke-virtual {v3, p1}, Lcom/flyersoft/components/MyMenu;->setAnchor(Landroid/view/View;)Lcom/flyersoft/components/MyMenu;

    move-result-object v3

    new-instance v4, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1;

    invoke-direct {v4, p0, v1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4$1;-><init>(Lcom/flyersoft/moonreaderp/ActivityMain$OneBookAnnotsAdapter$4;Lcom/flyersoft/moonreaderp/PrefChapters$AnnotItem;I)V

    invoke-virtual {v3, v2, v4}, Lcom/flyersoft/components/MyMenu;->setItems([Ljava/lang/CharSequence;Lcom/flyersoft/components/MyMenu$MenuItemClick;)Lcom/flyersoft/components/MyMenu;

    move-result-object v0

    const/high16 v1, 0x41200000    # 10.0f

    .line 12981
    invoke-static {v1}, Lcom/flyersoft/tools/A;->d(F)I

    move-result v1

    neg-int v1, v1

    invoke-virtual {v0, p1, v7, v1}, Lcom/flyersoft/components/MyMenu;->showOverflow(Landroid/view/View;II)V

    return-void
.end method
