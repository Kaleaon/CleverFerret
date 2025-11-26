.class public Lcom/facebook/common/callercontext/ContextChain;
.super Ljava/lang/Object;
.source "ContextChain.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/facebook/common/callercontext/ContextChain;",
            ">;"
        }
    .end annotation
.end field

.field private static final PARENT_SEPARATOR:C = '/'

.field public static final TAG_INFRA:Ljava/lang/String; = "i"

.field public static final TAG_PRODUCT:Ljava/lang/String; = "p"

.field public static final TAG_PRODUCT_AND_INFRA:Ljava/lang/String; = "pi"

.field private static sUseConcurrentHashMap:Z = false


# instance fields
.field private mExtraData:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final mName:Ljava/lang/String;

.field private final mParent:Lcom/facebook/common/callercontext/ContextChain;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private mSerializedChainString:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private mSerializedNodeString:Ljava/lang/String;

.field private final mTag:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 225
    new-instance v0, Lcom/facebook/common/callercontext/ContextChain$1;

    invoke-direct {v0}, Lcom/facebook/common/callercontext/ContextChain$1;-><init>()V

    sput-object v0, Lcom/facebook/common/callercontext/ContextChain;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 1

    .line 109
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 110
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/common/callercontext/ContextChain;->mTag:Ljava/lang/String;

    .line 111
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/common/callercontext/ContextChain;->mName:Ljava/lang/String;

    .line 112
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/common/callercontext/ContextChain;->mSerializedNodeString:Ljava/lang/String;

    .line 113
    const-class v0, Lcom/facebook/common/callercontext/ContextChain;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object p1

    check-cast p1, Lcom/facebook/common/callercontext/ContextChain;

    iput-object p1, p0, Lcom/facebook/common/callercontext/ContextChain;->mParent:Lcom/facebook/common/callercontext/ContextChain;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/facebook/common/callercontext/ContextChain;)V
    .locals 2
    .param p2    # Lcom/facebook/common/callercontext/ContextChain;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 102
    move-object v1, v0

    check-cast v1, Ljava/util/Map;

    invoke-direct {p0, p1, v0, p2}, Lcom/facebook/common/callercontext/ContextChain;-><init>(Ljava/lang/String;Ljava/util/Map;Lcom/facebook/common/callercontext/ContextChain;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/facebook/common/callercontext/ContextChain;)V
    .locals 1
    .param p3    # Lcom/facebook/common/callercontext/ContextChain;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 106
    invoke-direct {p0, p1, p2, v0, p3}, Lcom/facebook/common/callercontext/ContextChain;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Lcom/facebook/common/callercontext/ContextChain;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Lcom/facebook/common/callercontext/ContextChain;)V
    .locals 1
    .param p3    # Ljava/util/Map;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # Lcom/facebook/common/callercontext/ContextChain;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/facebook/common/callercontext/ContextChain;",
            ")V"
        }
    .end annotation

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    iput-object p1, p0, Lcom/facebook/common/callercontext/ContextChain;->mTag:Ljava/lang/String;

    .line 56
    iput-object p2, p0, Lcom/facebook/common/callercontext/ContextChain;->mName:Ljava/lang/String;

    .line 57
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ":"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/facebook/common/callercontext/ContextChain;->mSerializedNodeString:Ljava/lang/String;

    .line 58
    iput-object p4, p0, Lcom/facebook/common/callercontext/ContextChain;->mParent:Lcom/facebook/common/callercontext/ContextChain;

    .line 60
    invoke-direct {p0, p4, p3}, Lcom/facebook/common/callercontext/ContextChain;->initializeExtraData(Lcom/facebook/common/callercontext/ContextChain;Ljava/util/Map;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/util/Map;Lcom/facebook/common/callercontext/ContextChain;)V
    .locals 1
    .param p2    # Ljava/util/Map;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Lcom/facebook/common/callercontext/ContextChain;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/facebook/common/callercontext/ContextChain;",
            ")V"
        }
    .end annotation

    .line 92
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 93
    const-string v0, "serialized_tag"

    iput-object v0, p0, Lcom/facebook/common/callercontext/ContextChain;->mTag:Ljava/lang/String;

    .line 94
    const-string v0, "serialized_name"

    iput-object v0, p0, Lcom/facebook/common/callercontext/ContextChain;->mName:Ljava/lang/String;

    .line 95
    iput-object p1, p0, Lcom/facebook/common/callercontext/ContextChain;->mSerializedNodeString:Ljava/lang/String;

    .line 96
    iput-object p3, p0, Lcom/facebook/common/callercontext/ContextChain;->mParent:Lcom/facebook/common/callercontext/ContextChain;

    .line 98
    invoke-direct {p0, p3, p2}, Lcom/facebook/common/callercontext/ContextChain;->initializeExtraData(Lcom/facebook/common/callercontext/ContextChain;Ljava/util/Map;)V

    return-void
.end method

.method private initializeExtraData(Lcom/facebook/common/callercontext/ContextChain;Ljava/util/Map;)V
    .locals 1
    .param p1    # Lcom/facebook/common/callercontext/ContextChain;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/util/Map;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/facebook/common/callercontext/ContextChain;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "*>;)V"
        }
    .end annotation

    if-eqz p1, :cond_0

    .line 67
    invoke-virtual {p1}, Lcom/facebook/common/callercontext/ContextChain;->getExtraData()Ljava/util/Map;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    if-eqz p1, :cond_2

    .line 70
    sget-boolean v0, Lcom/facebook/common/callercontext/ContextChain;->sUseConcurrentHashMap:Z

    if-eqz v0, :cond_1

    .line 71
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0, p1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>(Ljava/util/Map;)V

    iput-object v0, p0, Lcom/facebook/common/callercontext/ContextChain;->mExtraData:Ljava/util/Map;

    goto :goto_1

    .line 73
    :cond_1
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0, p1}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    iput-object v0, p0, Lcom/facebook/common/callercontext/ContextChain;->mExtraData:Ljava/util/Map;

    :cond_2
    :goto_1
    if-eqz p2, :cond_5

    .line 78
    iget-object p1, p0, Lcom/facebook/common/callercontext/ContextChain;->mExtraData:Ljava/util/Map;

    if-nez p1, :cond_4

    .line 79
    sget-boolean p1, Lcom/facebook/common/callercontext/ContextChain;->sUseConcurrentHashMap:Z

    if-eqz p1, :cond_3

    .line 80
    new-instance p1, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {p1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object p1, p0, Lcom/facebook/common/callercontext/ContextChain;->mExtraData:Ljava/util/Map;

    goto :goto_2

    .line 82
    :cond_3
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/facebook/common/callercontext/ContextChain;->mExtraData:Ljava/util/Map;

    .line 85
    :cond_4
    :goto_2
    iget-object p1, p0, Lcom/facebook/common/callercontext/ContextChain;->mExtraData:Ljava/util/Map;

    invoke-interface {p1, p2}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    :cond_5
    return-void
.end method

.method public static setUseConcurrentHashMap(Z)V
    .locals 0

    .line 117
    sput-boolean p0, Lcom/facebook/common/callercontext/ContextChain;->sUseConcurrentHashMap:Z

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x1

    if-ne p0, p1, :cond_0

    return v0

    :cond_0
    const/4 v1, 0x0

    if-eqz p1, :cond_2

    .line 199
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-eq v2, v3, :cond_1

    goto :goto_0

    .line 202
    :cond_1
    check-cast p1, Lcom/facebook/common/callercontext/ContextChain;

    .line 203
    invoke-virtual {p0}, Lcom/facebook/common/callercontext/ContextChain;->getNodeString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lcom/facebook/common/callercontext/ContextChain;->getNodeString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/facebook/common/callercontext/ContextChain;->mParent:Lcom/facebook/common/callercontext/ContextChain;

    iget-object p1, p1, Lcom/facebook/common/callercontext/ContextChain;->mParent:Lcom/facebook/common/callercontext/ContextChain;

    .line 204
    invoke-static {v2, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_2

    return v0

    :cond_2
    :goto_0
    return v1
.end method

.method public getExtraData()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 130
    iget-object v0, p0, Lcom/facebook/common/callercontext/ContextChain;->mExtraData:Ljava/util/Map;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 121
    iget-object v0, p0, Lcom/facebook/common/callercontext/ContextChain;->mName:Ljava/lang/String;

    return-object v0
.end method

.method protected getNodeString()Ljava/lang/String;
    .locals 1

    .line 187
    iget-object v0, p0, Lcom/facebook/common/callercontext/ContextChain;->mSerializedNodeString:Ljava/lang/String;

    return-object v0
.end method

.method public getParent()Lcom/facebook/common/callercontext/ContextChain;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 135
    iget-object v0, p0, Lcom/facebook/common/callercontext/ContextChain;->mParent:Lcom/facebook/common/callercontext/ContextChain;

    return-object v0
.end method

.method public getRootContextChain()Lcom/facebook/common/callercontext/ContextChain;
    .locals 1

    .line 140
    iget-object v0, p0, Lcom/facebook/common/callercontext/ContextChain;->mParent:Lcom/facebook/common/callercontext/ContextChain;

    if-nez v0, :cond_0

    return-object p0

    :cond_0
    invoke-virtual {v0}, Lcom/facebook/common/callercontext/ContextChain;->getRootContextChain()Lcom/facebook/common/callercontext/ContextChain;

    move-result-object v0

    return-object v0
.end method

.method public getStringExtra(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 144
    iget-object v0, p0, Lcom/facebook/common/callercontext/ContextChain;->mExtraData:Ljava/util/Map;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    .line 148
    :cond_0
    sget-boolean v2, Lcom/facebook/common/callercontext/ContextChain;->sUseConcurrentHashMap:Z

    if-eqz v2, :cond_1

    if-nez p1, :cond_1

    return-object v1

    .line 151
    :cond_1
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    if-nez p1, :cond_2

    return-object v1

    .line 152
    :cond_2
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getTag()Ljava/lang/String;
    .locals 1

    .line 125
    iget-object v0, p0, Lcom/facebook/common/callercontext/ContextChain;->mTag:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 4

    .line 209
    iget-object v0, p0, Lcom/facebook/common/callercontext/ContextChain;->mParent:Lcom/facebook/common/callercontext/ContextChain;

    invoke-virtual {p0}, Lcom/facebook/common/callercontext/ContextChain;->getNodeString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object v0, v2, v3

    const/4 v0, 0x1

    aput-object v1, v2, v0

    invoke-static {v2}, Ljava/util/Objects;->hash([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public putObjectExtra(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 2

    .line 157
    sget-boolean v0, Lcom/facebook/common/callercontext/ContextChain;->sUseConcurrentHashMap:Z

    if-eqz v0, :cond_1

    if-eqz p1, :cond_0

    if-nez p2, :cond_1

    :cond_0
    return-void

    .line 160
    :cond_1
    iget-object v1, p0, Lcom/facebook/common/callercontext/ContextChain;->mExtraData:Ljava/util/Map;

    if-nez v1, :cond_3

    if-eqz v0, :cond_2

    .line 162
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/facebook/common/callercontext/ContextChain;->mExtraData:Ljava/util/Map;

    goto :goto_0

    .line 164
    :cond_2
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/facebook/common/callercontext/ContextChain;->mExtraData:Ljava/util/Map;

    .line 167
    :cond_3
    :goto_0
    iget-object v0, p0, Lcom/facebook/common/callercontext/ContextChain;->mExtraData:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 172
    iget-object v0, p0, Lcom/facebook/common/callercontext/ContextChain;->mSerializedChainString:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 173
    invoke-virtual {p0}, Lcom/facebook/common/callercontext/ContextChain;->getNodeString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/common/callercontext/ContextChain;->mSerializedChainString:Ljava/lang/String;

    .line 174
    iget-object v0, p0, Lcom/facebook/common/callercontext/ContextChain;->mParent:Lcom/facebook/common/callercontext/ContextChain;

    if-eqz v0, :cond_0

    .line 175
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/facebook/common/callercontext/ContextChain;->mParent:Lcom/facebook/common/callercontext/ContextChain;

    invoke-virtual {v1}, Lcom/facebook/common/callercontext/ContextChain;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/16 v1, 0x2f

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/facebook/common/callercontext/ContextChain;->mSerializedChainString:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/facebook/common/callercontext/ContextChain;->mSerializedChainString:Ljava/lang/String;

    .line 178
    :cond_0
    iget-object v0, p0, Lcom/facebook/common/callercontext/ContextChain;->mSerializedChainString:Ljava/lang/String;

    return-object v0
.end method

.method public toStringArray()[Ljava/lang/String;
    .locals 2

    .line 191
    invoke-virtual {p0}, Lcom/facebook/common/callercontext/ContextChain;->toString()Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x2f

    invoke-static {v1}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 1

    .line 219
    iget-object v0, p0, Lcom/facebook/common/callercontext/ContextChain;->mTag:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 220
    iget-object v0, p0, Lcom/facebook/common/callercontext/ContextChain;->mName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 221
    invoke-virtual {p0}, Lcom/facebook/common/callercontext/ContextChain;->getNodeString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 222
    iget-object v0, p0, Lcom/facebook/common/callercontext/ContextChain;->mParent:Lcom/facebook/common/callercontext/ContextChain;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    return-void
.end method
