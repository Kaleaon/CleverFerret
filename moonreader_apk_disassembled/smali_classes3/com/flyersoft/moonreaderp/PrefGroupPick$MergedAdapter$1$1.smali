.class Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter$1$1;
.super Ljava/lang/Object;
.source "PrefGroupPick.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter$1;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter$1;

.field final synthetic val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;


# direct methods
.method constructor <init>(Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter$1;Lcom/flyersoft/tools/BookDb$BookInfo;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            null,
            null
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 228
    iput-object p1, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter$1$1;->this$2:Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter$1;

    iput-object p2, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter$1$1;->val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 231
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter$1$1;->val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    iget-object p1, p1, Lcom/flyersoft/tools/BookDb$BookInfo;->groupBooks:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    .line 232
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter$1$1;->val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    const/4 p2, 0x0

    invoke-static {p1, p2}, Lcom/flyersoft/tools/BookDb;->insertBook(Lcom/flyersoft/tools/BookDb$BookInfo;Z)J

    .line 233
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter$1$1;->this$2:Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter$1;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter$1;->this$1:Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupPick;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefGroupPick;->groups:Ljava/util/ArrayList;

    iget-object p2, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter$1$1;->val$bi:Lcom/flyersoft/tools/BookDb$BookInfo;

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 234
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter$1$1;->this$2:Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter$1;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter$1;->this$1:Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupPick;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefGroupPick;->groupAdapter:Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;

    invoke-virtual {p1}, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;->notifyDataSetChanged()V

    .line 235
    iget-object p1, p0, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter$1$1;->this$2:Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter$1;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter$1;->this$1:Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;

    iget-object p1, p1, Lcom/flyersoft/moonreaderp/PrefGroupPick$MergedAdapter;->this$0:Lcom/flyersoft/moonreaderp/PrefGroupPick;

    const/4 p2, 0x2

    iput p2, p1, Lcom/flyersoft/moonreaderp/PrefGroupPick;->modifyLevel:I

    return-void
.end method
