.class Lcom/flyersoft/components/cloud/Gdrive$3;
.super Ljava/lang/Object;
.source "Gdrive.java"

# interfaces
.implements Lcom/google/android/gms/tasks/OnFailureListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/Gdrive;->handleSignInResult(Landroid/app/Activity;Landroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic val$act:Landroid/app/Activity;


# direct methods
.method constructor <init>(Landroid/app/Activity;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 319
    iput-object p1, p0, Lcom/flyersoft/components/cloud/Gdrive$3;->val$act:Landroid/app/Activity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFailure(Ljava/lang/Exception;)V
    .locals 3

    .line 322
    invoke-static {p1}, Lcom/flyersoft/tools/A;->errorMsg(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    const-string v2, "Unable to sign in."

    aput-object v2, v0, v1

    const/4 v2, 0x1

    aput-object p1, v0, v2

    invoke-static {v0}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 323
    sput-boolean v1, Lcom/flyersoft/components/cloud/Sync;->syncWindowOpened:Z

    .line 324
    iget-object p1, p0, Lcom/flyersoft/components/cloud/Gdrive$3;->val$act:Landroid/app/Activity;

    instance-of v0, p1, Lcom/flyersoft/moonreaderp/ActivityTxt;

    if-eqz v0, :cond_0

    .line 325
    invoke-static {p1, v2}, Lcom/flyersoft/components/cloud/Gdrive;->afterFailedLogin(Landroid/content/Context;Z)V

    .line 327
    :cond_0
    iget-object p1, p0, Lcom/flyersoft/components/cloud/Gdrive$3;->val$act:Landroid/app/Activity;

    sget v0, Lcom/flyersoft/moonreaderp/R$string;->login_failed:I

    invoke-virtual {p1, v0}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0, v2}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/CharSequence;I)V

    return-void
.end method
