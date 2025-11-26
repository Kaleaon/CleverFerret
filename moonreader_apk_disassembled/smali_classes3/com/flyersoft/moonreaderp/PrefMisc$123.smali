.class Lcom/flyersoft/moonreaderp/PrefMisc$123;
.super Ljava/lang/Object;
.source "PrefMisc.java"

# interfaces
.implements Lio/reactivex/rxjava3/core/ObservableOnSubscribe;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/flyersoft/moonreaderp/PrefMisc;->getDropboxAccountInfo(Landroid/widget/TextView;Landroid/widget/ProgressBar;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/reactivex/rxjava3/core/ObservableOnSubscribe<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 3425
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public subscribe(Lio/reactivex/rxjava3/core/ObservableEmitter;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lio/reactivex/rxjava3/core/ObservableEmitter<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    const-string v0, "Email: "

    .line 3428
    :try_start_0
    invoke-static {}, Lcom/flyersoft/components/cloud/Cloud;->getDropbox()Lcom/flyersoft/components/cloud/Dropbox;

    move-result-object v1

    invoke-virtual {v1}, Lcom/flyersoft/components/cloud/Dropbox;->getClient()Lcom/dropbox/core/v2/DbxClientV2;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/v2/DbxClientV2;->users()Lcom/dropbox/core/v2/users/DbxUserUsersRequests;

    move-result-object v1

    invoke-virtual {v1}, Lcom/dropbox/core/v2/users/DbxUserUsersRequests;->getCurrentAccount()Lcom/dropbox/core/v2/users/FullAccount;

    move-result-object v1

    .line 3429
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Lcom/dropbox/core/v2/users/FullAccount;->getEmail()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\nName: "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Lcom/dropbox/core/v2/users/FullAccount;->getName()Lcom/dropbox/core/v2/users/Name;

    move-result-object v0

    invoke-virtual {v0}, Lcom/dropbox/core/v2/users/Name;->getDisplayName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\nAccount Type: "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 3430
    invoke-virtual {v1}, Lcom/dropbox/core/v2/users/FullAccount;->getAccountType()Lcom/dropbox/core/v2/userscommon/AccountType;

    move-result-object v0

    invoke-virtual {v0}, Lcom/dropbox/core/v2/userscommon/AccountType;->name()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 3431
    invoke-interface {p1, v0}, Lio/reactivex/rxjava3/core/ObservableEmitter;->onNext(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception v0

    .line 3433
    invoke-static {v0}, Lcom/flyersoft/tools/A;->error(Ljava/lang/Throwable;)V

    .line 3434
    invoke-interface {p1, v0}, Lio/reactivex/rxjava3/core/ObservableEmitter;->onNext(Ljava/lang/Object;)V

    return-void
.end method
