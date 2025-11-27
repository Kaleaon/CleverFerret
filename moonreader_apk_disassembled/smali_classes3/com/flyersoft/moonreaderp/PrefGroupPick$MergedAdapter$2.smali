.class Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter$2;
.super Ljava/lang/Object;
.source "PrefGroupPick.java"

# interfaces
.implements Landroid/view/View$OnLongClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 241
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLongClick(Landroid/view/View;)Z
    .locals 5

    .line 244
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/flyersoft/tools/BookDb$BookInfo;

    .line 245
    iget-object v0, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;

    iget-object v0, v0, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupPick;

    invoke-virtual {v0}, Lcom/flyersoft/moonreaderp/PrefGroupPick;->getContext()Landroid/content/Context;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v2, 0x1

    invoke-virtual {p1, v2}, Lcom/flyersoft/tools/BookDb$BookInfo;->getGroupName(Z)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "\n"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 246
    invoke-virtual {p1}, Lcom/flyersoft/tools/BookDb$BookInfo;->isGroup()Z

    move-result v3

    const/4 v4, 0x0

    if-eqz v3, :cond_0

    invoke-virtual {p1, v4}, Lcom/flyersoft/tools/BookDb$BookInfo;->getGroupListName(Z)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    iget-object p1, p1, Lcom/flyersoft/tools/BookDb$BookInfo;->book:Ljava/lang/String;

    :goto_0
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 245
    invoke-static {v0, p1}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;)V

    .line 247
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupPick;

    iput-boolean v2, p1, Lcom/flyersoft/moonreaderp/PrefGroupPick;->mShowRemoveButton:Z

    .line 248
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter$2;->this$1:Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;->notifyDataSetChanged()V

    return v4
.end method
