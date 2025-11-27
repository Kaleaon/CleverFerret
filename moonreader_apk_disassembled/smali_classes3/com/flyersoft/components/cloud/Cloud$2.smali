.class Lcom/flyersoft/components/cloud/Cloud$2;
.super Ljava/lang/Object;
.source "Cloud.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/Cloud;->createProgressDialog(Landroid/content/Context;Ljava/lang/String;)Landroid/app/ProgressDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/flyersoft/components/cloud/Cloud;


# direct methods
.method constructor <init>(Lcom/flyersoft/components/cloud/Cloud;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 167
    iput-object p1, p0, Lcom/flyersoft/components/cloud/Cloud$2;->this$0:Lcom/flyersoft/components/cloud/Cloud;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 169
    iget-object p1, p0, Lcom/flyersoft/components/cloud/Cloud$2;->this$0:Lcom/flyersoft/components/cloud/Cloud;

    const/4 p2, 0x1

    iput-boolean p2, p1, Lcom/flyersoft/components/cloud/Cloud;->mCanceled:Z

    return-void
.end method
