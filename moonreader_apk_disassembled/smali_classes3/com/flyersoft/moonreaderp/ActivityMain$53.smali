.class Lcom/flyersoft/moonreaderp/ActivityMain$53;
.super Ljava/lang/Object;
.source "ActivityMain.java"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/ActivityMain;->showOptionsWindow(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

.field final synthetic val$amoled:Z

.field final synthetic val$coverWithProgress:Z

.field final synthetic val$languageID:I

.field final synthetic val$simpleRecentList:Z

.field final synthetic val$useDynamicColor:Z

.field final synthetic val$woody:Z

.field final synthetic val$woodyResDay:I

.field final synthetic val$woodyResNight:I


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/ActivityMain;IZIIZZZZ)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010,
            0x1010,
            0x1010,
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

    .line 4888
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$53;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iput p2, p0, Lcom/flyersoft/moonreaderp/ActivityMain$53;->val$languageID:I

    iput-boolean p3, p0, Lcom/flyersoft/moonreaderp/ActivityMain$53;->val$woody:Z

    iput p4, p0, Lcom/flyersoft/moonreaderp/ActivityMain$53;->val$woodyResDay:I

    iput p5, p0, Lcom/flyersoft/moonreaderp/ActivityMain$53;->val$woodyResNight:I

    iput-boolean p6, p0, Lcom/flyersoft/moonreaderp/ActivityMain$53;->val$simpleRecentList:Z

    iput-boolean p7, p0, Lcom/flyersoft/moonreaderp/ActivityMain$53;->val$coverWithProgress:Z

    iput-boolean p8, p0, Lcom/flyersoft/moonreaderp/ActivityMain$53;->val$useDynamicColor:Z

    iput-boolean p9, p0, Lcom/flyersoft/moonreaderp/ActivityMain$53;->val$amoled:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 3

    .line 4890
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$53;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    const/4 v0, 0x0

    iput-object v0, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->prefShelf:Lcom/flyersoft/moonreaderp/PrefShelf;

    .line 4891
    iget p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$53;->val$languageID:I

    sget v0, Lcom/flyersoft/tools/A;->languageID:I

    const/4 v1, 0x0

    if-eq p1, v0, :cond_2

    .line 4892
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$53;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/tools/A;->SaveOptions(Landroid/content/Context;)V

    .line 4893
    sget p1, Lcom/flyersoft/tools/A;->languageID:I

    if-nez p1, :cond_0

    .line 4894
    invoke-static {v1}, Ljava/lang/System;->exit(I)V

    return-void

    .line 4895
    :cond_0
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0x1a

    if-ge p1, v0, :cond_1

    .line 4896
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$53;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->restartApp()V

    return-void

    .line 4898
    :cond_1
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$53;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mexitProgram(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    return-void

    .line 4901
    :cond_2
    sget-boolean p1, Lcom/flyersoft/tools/A;->woodyChanged:Z

    const/4 v0, 0x1

    if-nez p1, :cond_3

    iget-boolean p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$53;->val$woody:Z

    sget-boolean v2, Lcom/flyersoft/tools/A;->woody:Z

    if-ne p1, v2, :cond_3

    iget p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$53;->val$woodyResDay:I

    sget v2, Lcom/flyersoft/tools/A;->woodyResDay:I

    if-ne p1, v2, :cond_3

    iget p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$53;->val$woodyResNight:I

    sget v2, Lcom/flyersoft/tools/A;->woodyResNight:I

    if-eq p1, v2, :cond_5

    .line 4902
    :cond_3
    sget-boolean p1, Lcom/flyersoft/tools/A;->woody:Z

    if-eqz p1, :cond_4

    .line 4903
    sput v0, Lcom/flyersoft/tools/A;->shelfStyle:I

    .line 4904
    :cond_4
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$53;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->updateShelf()V

    .line 4906
    :cond_5
    iget-boolean p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$53;->val$simpleRecentList:Z

    sget-boolean v2, Lcom/flyersoft/tools/A;->simpleRecentList:Z

    if-eq p1, v2, :cond_8

    .line 4907
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$53;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->recentLv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {p1, v2}, Lcom/flyersoft/moonreaderp/ActivityMain;->getAdapter(Landroidx/recyclerview/widget/RecyclerView;)Landroidx/recyclerview/widget/RecyclerView$Adapter;

    move-result-object p1

    if-nez p1, :cond_6

    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$53;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    iget-object v2, p1, Lcom/flyersoft/moonreaderp/ActivityMain;->dashRv:Lcom/flyersoft/views/recyclerview/MyRecyclerView;

    invoke-virtual {p1, v2}, Lcom/flyersoft/moonreaderp/ActivityMain;->getAdapter(Landroidx/recyclerview/widget/RecyclerView;)Landroidx/recyclerview/widget/RecyclerView$Adapter;

    move-result-object p1

    if-eqz p1, :cond_8

    .line 4908
    :cond_6
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$53;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1, v0}, Lcom/flyersoft/moonreaderp/ActivityMain;->show_main_dash(Z)Landroid/view/View;

    .line 4909
    sget-boolean p1, Lcom/flyersoft/tools/A;->simpleRecentList:Z

    if-nez p1, :cond_8

    .line 4910
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$53;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->setRecentListVisible(Z)V

    .line 4911
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$53;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget v2, Lcom/flyersoft/tools/A;->lastDashItem:I

    if-lez v2, :cond_7

    const/4 v1, 0x1

    :cond_7
    invoke-static {p1, v1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$mforceFavVisible(Lcom/flyersoft/moonreaderp/ActivityMain;Z)V

    .line 4915
    :cond_8
    iget-boolean p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$53;->val$coverWithProgress:Z

    sget-boolean v0, Lcom/flyersoft/tools/A;->coverWithProgress:Z

    if-eq p1, v0, :cond_9

    .line 4916
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$53;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->updateCoverProgress()V

    .line 4917
    :cond_9
    iget-boolean p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$53;->val$useDynamicColor:Z

    sget-boolean v0, Lcom/flyersoft/tools/A;->useDynamicColor:Z

    if-ne p1, v0, :cond_b

    iget-boolean p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$53;->val$amoled:Z

    sget-boolean v0, Lcom/flyersoft/tools/A;->amoled:Z

    if-eq p1, v0, :cond_a

    goto :goto_0

    :cond_a
    return-void

    .line 4918
    :cond_b
    :goto_0
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/ActivityMain$53;->this$0:Lcom/flyersoft/moonreaderp/ActivityMain;

    invoke-static {p1}, Lcom/flyersoft/moonreaderp/ActivityMain;->-$$Nest$msetNotificationBarColor(Lcom/flyersoft/moonreaderp/ActivityMain;)V

    return-void
.end method
