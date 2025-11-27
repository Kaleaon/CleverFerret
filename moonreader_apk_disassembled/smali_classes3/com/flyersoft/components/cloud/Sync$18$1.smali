.class Lcom/flyersoft/components/cloud/Sync$18$1;
.super Ljava/lang/Object;
.source "Sync.java"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/Sync$18;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/components/cloud/Sync$18;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/cloud/Sync$18;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 937
    iput-object p1, p0, Lcom/flyersoft/components/cloud/Sync$18$1;->this$0:Lcom/flyersoft/components/cloud/Sync$18;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 1

    .line 940
    iget-object p1, p0, Lcom/flyersoft/components/cloud/Sync$18$1;->this$0:Lcom/flyersoft/components/cloud/Sync$18;

    iget-object p1, p1, Lcom/flyersoft/components/cloud/Sync$18;->val$newBooks:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    add-int/lit8 p1, p1, -0x1

    :goto_0
    if-ltz p1, :cond_1

    .line 941
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Sync$18$1;->this$0:Lcom/flyersoft/components/cloud/Sync$18;

    iget-object v0, v0, Lcom/flyersoft/components/cloud/Sync$18;->val$selected:[Z

    aget-boolean v0, v0, p1

    if-nez v0, :cond_0

    .line 942
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Sync$18$1;->this$0:Lcom/flyersoft/components/cloud/Sync$18;

    iget-object v0, v0, Lcom/flyersoft/components/cloud/Sync$18;->val$newBooks:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    :cond_0
    add-int/lit8 p1, p1, -0x1

    goto :goto_0

    :cond_1
    return-void
.end method
