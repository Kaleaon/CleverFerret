.class Lcom/facebook/common/callercontext/ContextChain$1;
.super Ljava/lang/Object;
.source "ContextChain.java"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/facebook/common/callercontext/ContextChain;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator<",
        "Lcom/facebook/common/callercontext/ContextChain;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 226
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Lcom/facebook/common/callercontext/ContextChain;
    .locals 1

    .line 229
    new-instance v0, Lcom/facebook/common/callercontext/ContextChain;

    invoke-direct {v0, p1}, Lcom/facebook/common/callercontext/ContextChain;-><init>(Landroid/os/Parcel;)V

    return-object v0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 0

    .line 226
    invoke-virtual {p0, p1}, Lcom/facebook/common/callercontext/ContextChain$1;->createFromParcel(Landroid/os/Parcel;)Lcom/facebook/common/callercontext/ContextChain;

    move-result-object p1

    return-object p1
.end method

.method public newArray(I)[Lcom/facebook/common/callercontext/ContextChain;
    .locals 0

    .line 234
    new-array p1, p1, [Lcom/facebook/common/callercontext/ContextChain;

    return-object p1
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 0

    .line 226
    invoke-virtual {p0, p1}, Lcom/facebook/common/callercontext/ContextChain$1;->newArray(I)[Lcom/facebook/common/callercontext/ContextChain;

    move-result-object p1

    return-object p1
.end method
