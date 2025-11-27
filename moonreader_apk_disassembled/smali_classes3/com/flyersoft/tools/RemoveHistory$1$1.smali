.class Lcom/flyersoft/tools/RemoveHistory$1$1;
.super Ljava/lang/Object;
.source "RemoveHistory.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/tools/RemoveHistory$1;->onClick(Landroid/content/DialogInterface;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/tools/RemoveHistory$1;


# direct methods
.method constructor <init>(Lcom/flyersoft/tools/RemoveHistory$1;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 37
    iput-object p1, p0, Lcom/flyersoft/tools/RemoveHistory$1$1;->this$0:Lcom/flyersoft/tools/RemoveHistory$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1

    .line 40
    iget-object v0, p0, Lcom/flyersoft/tools/RemoveHistory$1$1;->this$0:Lcom/flyersoft/tools/RemoveHistory$1;

    iget-object v0, v0, Lcom/flyersoft/tools/RemoveHistory$1;->val$onClearButton:Landroid/content/DialogInterface$OnClickListener;

    if-eqz v0, :cond_0

    .line 41
    iget-object v0, p0, Lcom/flyersoft/tools/RemoveHistory$1$1;->this$0:Lcom/flyersoft/tools/RemoveHistory$1;

    iget-object v0, v0, Lcom/flyersoft/tools/RemoveHistory$1;->val$onClearButton:Landroid/content/DialogInterface$OnClickListener;

    invoke-interface {v0, p1, p2}, Landroid/content/DialogInterface$OnClickListener;->onClick(Landroid/content/DialogInterface;I)V

    :cond_0
    return-void
.end method
