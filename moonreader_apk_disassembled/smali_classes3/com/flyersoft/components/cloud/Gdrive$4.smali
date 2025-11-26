.class Lcom/flyersoft/components/cloud/Gdrive$4;
.super Ljava/lang/Object;
.source "Gdrive.java"

# interfaces
.implements Lcom/google/android/gms/tasks/OnSuccessListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/components/cloud/Gdrive;->handleSignInResult(Landroid/app/Activity;Landroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/android/gms/tasks/OnSuccessListener<",
        "Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;",
        ">;"
    }
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

    .line 297
    iput-object p1, p0, Lcom/flyersoft/components/cloud/Gdrive$4;->val$act:Landroid/app/Activity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onSuccess(Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;)V
    .locals 4

    .line 300
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Signed in as "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;->getEmail()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    invoke-static {v2}, Lcom/flyersoft/tools/A;->log([Ljava/lang/Object;)V

    .line 301
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/flyersoft/tools/A;->xml_files_folder:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/gdrive_unlink"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/tools/T;->deleteFile(Ljava/lang/String;)Z

    .line 302
    sput-boolean v3, Lcom/flyersoft/components/cloud/Sync;->syncWindowOpened:Z

    .line 303
    invoke-static {}, Lcom/flyersoft/components/cloud/Cloud;->getGdrive()Lcom/flyersoft/components/cloud/Gdrive;

    move-result-object v0

    invoke-static {v0}, Lcom/flyersoft/components/cloud/Gdrive;->-$$Nest$minit(Lcom/flyersoft/components/cloud/Gdrive;)V

    .line 304
    invoke-static {}, Lcom/flyersoft/components/cloud/Cloud;->getGdrive()Lcom/flyersoft/components/cloud/Gdrive;

    move-result-object v0

    invoke-virtual {v0}, Lcom/flyersoft/components/cloud/Gdrive;->getSharedPref()Landroid/content/SharedPreferences;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v2, "login"

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 305
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive$4;->val$act:Landroid/app/Activity;

    instance-of v0, v0, Lcom/flyersoft/moonreaderp/ActivityMain;

    const/4 v2, 0x4

    if-eqz v0, :cond_0

    .line 306
    sget v0, Lcom/flyersoft/tools/A;->lastTab:I

    const/4 v3, 0x2

    if-ne v0, v3, :cond_0

    .line 307
    sput v2, Lcom/flyersoft/tools/A;->files_from:I

    .line 308
    sget-object v0, Lcom/flyersoft/moonreaderp/ActivityMain;->selfPref:Lcom/flyersoft/moonreaderp/ActivityMain;

    sget-object v3, Lcom/flyersoft/tools/A;->lastGdrivePath:Ljava/lang/String;

    invoke-virtual {v0, v3}, Lcom/flyersoft/moonreaderp/ActivityMain;->showCloudFolder(Ljava/lang/String;)V

    .line 311
    :cond_0
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive$4;->val$act:Landroid/app/Activity;

    instance-of v0, v0, Lcom/flyersoft/moonreaderp/ActivityTxt;

    if-eqz v0, :cond_1

    .line 312
    sput v2, Lcom/flyersoft/tools/A;->syncType:I

    .line 313
    sget-boolean v0, Lcom/flyersoft/tools/A;->syncProgress:Z

    if-eqz v0, :cond_1

    .line 314
    sget-boolean v0, Lcom/flyersoft/tools/A;->showSyncMsg:Z

    invoke-static {v1, v0}, Lcom/flyersoft/components/cloud/Sync;->downloadCloudPositionFile(ZZ)V

    .line 316
    :cond_1
    iget-object v0, p0, Lcom/flyersoft/components/cloud/Gdrive$4;->val$act:Landroid/app/Activity;

    sget v2, Lcom/flyersoft/moonreaderp/R$string;->login_success:I

    invoke-virtual {v0, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;->getEmail()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, v2, p1, v1}, Lcom/flyersoft/tools/T;->showToastText(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;I)V

    return-void
.end method

.method public bridge synthetic onSuccess(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            null
        }
    .end annotation

    .line 297
    check-cast p1, Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;

    invoke-virtual {p0, p1}, Lcom/flyersoft/components/cloud/Gdrive$4;->onSuccess(Lcom/google/android/gms/auth/api/signin/GoogleSignInAccount;)V

    return-void
.end method
