.class Lcom/flyersoft/components/cloud/Sync$18$2;
.super Ljava/lang/Object;
.source "Sync.java"

# interfaces
.implements Landroid/content/DialogInterface$OnMultiChoiceClickListener;


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

    .line 931
    iput-object p1, p0, Lcom/flyersoft/components/cloud/Sync$18$2;->this$0:Lcom/flyersoft/components/cloud/Sync$18;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;IZ)V
    .locals 0

    .line 934
    iget-object p1, p0, Lcom/flyersoft/components/cloud/Sync$18$2;->this$0:Lcom/flyersoft/components/cloud/Sync$18;

    iget-object p1, p1, Lcom/flyersoft/components/cloud/Sync$18;->val$selected:[Z

    aput-boolean p3, p1, p2

    return-void
.end method
