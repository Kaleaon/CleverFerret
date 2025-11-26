.class Lcom/flyersoft/components/cloud/Sync$21$2;
.super Ljava/lang/Object;
.source "Sync.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/Sync$21;->onClick(Landroid/content/DialogInterface;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/components/cloud/Sync$21;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/cloud/Sync$21;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 969
    iput-object p1, p0, Lcom/flyersoft/components/cloud/Sync$21$2;->this$0:Lcom/flyersoft/components/cloud/Sync$21;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 972
    iget-object p1, p0, Lcom/flyersoft/components/cloud/Sync$21$2;->this$0:Lcom/flyersoft/components/cloud/Sync$21;

    iget-object p1, p1, Lcom/flyersoft/components/cloud/Sync$21;->val$cloudBooks:Ljava/util/List;

    invoke-static {p1}, Lcom/flyersoft/components/cloud/Sync;->-$$Nest$smdoCloneShelf(Ljava/util/List;)V

    return-void
.end method
