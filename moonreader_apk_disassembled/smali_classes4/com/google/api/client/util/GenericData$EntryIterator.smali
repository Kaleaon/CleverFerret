.class final Lcom/google/api/client/util/GenericData$EntryIterator;
.super Ljava/lang/Object;
.source "GenericData.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/api/client/util/GenericData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "EntryIterator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator<",
        "Ljava/util/Map$Entry<",
        "Ljava/lang/String;",
        "Ljava/lang/Object;",
        ">;>;"
    }
.end annotation


# instance fields
.field private final fieldIterator:Ljava/util/Iterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Iterator<",
            "Ljava/util/Map$Entry<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field

.field private startedUnknown:Z

.field final synthetic this$0:Lcom/google/api/client/util/GenericData;

.field private final unknownIterator:Ljava/util/Iterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Iterator<",
            "Ljava/util/Map$Entry<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/google/api/client/util/GenericData;Lcom/google/api/client/util/DataMap$EntrySet;)V
    .locals 0

    .line 263
    iput-object p1, p0, Lcom/google/api/client/util/GenericData$EntryIterator;->this$0:Lcom/google/api/client/util/GenericData;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 264
    invoke-virtual {p2}, Lcom/google/api/client/util/DataMap$EntrySet;->iterator()Lcom/google/api/client/util/DataMap$EntryIterator;

    move-result-object p2

    iput-object p2, p0, Lcom/google/api/client/util/GenericData$EntryIterator;->fieldIterator:Ljava/util/Iterator;

    .line 265
    iget-object p1, p1, Lcom/google/api/client/util/GenericData;->unknownFields:Ljava/util/Map;

    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    iput-object p1, p0, Lcom/google/api/client/util/GenericData$EntryIterator;->unknownIterator:Ljava/util/Iterator;

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 1

    .line 269
    iget-object v0, p0, Lcom/google/api/client/util/GenericData$EntryIterator;->fieldIterator:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/google/api/client/util/GenericData$EntryIterator;->unknownIterator:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    return v0

    :cond_1
    :goto_0
    const/4 v0, 0x1

    return v0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .line 252
    invoke-virtual {p0}, Lcom/google/api/client/util/GenericData$EntryIterator;->next()Ljava/util/Map$Entry;

    move-result-object v0

    return-object v0
.end method

.method public next()Ljava/util/Map$Entry;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map$Entry<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 273
    iget-boolean v0, p0, Lcom/google/api/client/util/GenericData$EntryIterator;->startedUnknown:Z

    if-nez v0, :cond_1

    .line 274
    iget-object v0, p0, Lcom/google/api/client/util/GenericData$EntryIterator;->fieldIterator:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 275
    iget-object v0, p0, Lcom/google/api/client/util/GenericData$EntryIterator;->fieldIterator:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    return-object v0

    :cond_0
    const/4 v0, 0x1

    .line 277
    iput-boolean v0, p0, Lcom/google/api/client/util/GenericData$EntryIterator;->startedUnknown:Z

    .line 279
    :cond_1
    iget-object v0, p0, Lcom/google/api/client/util/GenericData$EntryIterator;->unknownIterator:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    return-object v0
.end method

.method public remove()V
    .locals 1

    .line 283
    iget-boolean v0, p0, Lcom/google/api/client/util/GenericData$EntryIterator;->startedUnknown:Z

    if-eqz v0, :cond_0

    .line 284
    iget-object v0, p0, Lcom/google/api/client/util/GenericData$EntryIterator;->unknownIterator:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 286
    :cond_0
    iget-object v0, p0, Lcom/google/api/client/util/GenericData$EntryIterator;->fieldIterator:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    return-void
.end method
