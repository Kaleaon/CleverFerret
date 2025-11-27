.class Lcom/flyersoft/moonreaderp/PrefChapters$15;
.super Ljava/lang/Object;
.source "PrefChapters.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefChapters;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

.field final synthetic val$cb1:Landroid/widget/CheckBox;

.field final synthetic val$cb2:Landroid/widget/CheckBox;

.field final synthetic val$cb3:Landroid/widget/CheckBox;

.field final synthetic val$cb4:Landroid/widget/CheckBox;

.field final synthetic val$sortByDate:Z


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefChapters;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Landroid/widget/CheckBox;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010,
            0x1010,
            0x1010,
            0x1010
        }
        names = {
            null,
            null,
            null,
            null,
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 970
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$15;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefChapters$15;->val$cb1:Landroid/widget/CheckBox;

    iput-object p3, p0, Lcom/flyersoft/moonreaderp/PrefChapters$15;->val$cb2:Landroid/widget/CheckBox;

    iput-object p4, p0, Lcom/flyersoft/moonreaderp/PrefChapters$15;->val$cb3:Landroid/widget/CheckBox;

    iput-object p5, p0, Lcom/flyersoft/moonreaderp/PrefChapters$15;->val$cb4:Landroid/widget/CheckBox;

    iput-boolean p6, p0, Lcom/flyersoft/moonreaderp/PrefChapters$15;->val$sortByDate:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 972
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$15;->val$cb1:Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    sput-boolean p1, Lcom/flyersoft/tools/A;->bookmarkManually:Z

    .line 973
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$15;->val$cb2:Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    sput-boolean p1, Lcom/flyersoft/tools/A;->bookmarkSortByDate:Z

    .line 974
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$15;->val$cb3:Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    sput-boolean p1, Lcom/flyersoft/tools/A;->shareWithChapter:Z

    .line 975
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$15;->val$cb4:Landroid/widget/CheckBox;

    invoke-virtual {p1}, Landroid/widget/CheckBox;->isChecked()Z

    move-result p1

    sput-boolean p1, Lcom/flyersoft/tools/A;->syncReadWise:Z

    .line 976
    iget-boolean p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$15;->val$sortByDate:Z

    sget-boolean p2, Lcom/flyersoft/tools/A;->bookmarkSortByDate:Z

    if-eq p1, p2, :cond_0

    .line 977
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$15;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefChapters;->refreshBookmarkList()V

    goto :goto_0

    .line 978
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$15;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters;->bookmarkAdapter:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;

    if-eqz p1, :cond_1

    .line 979
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$15;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefChapters;->bookmarkAdapter:Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefChapters$AnnotsAdapter;->notifyDataSetChanged()V

    .line 980
    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$15;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/PrefChapters;->-$$Nest$mhideSystemNavigation(Lcom/flyersoft/moonreaderp/PrefChapters;)V

    .line 981
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefChapters$15;->this$0:Lcom/flyersoft/moonreaderp/PrefChapters;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefChapters;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/flyersoft/tools/A;->SaveOptions(Landroid/content/Context;)V

    return-void
.end method
