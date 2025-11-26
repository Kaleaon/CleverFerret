.class public abstract Lcom/vladsch/flexmark/util/builder/BuilderBase;
.super Lcom/vladsch/flexmark/util/options/MutableDataSet;
.source "BuilderBase.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/vladsch/flexmark/util/builder/BuilderBase;",
        ">",
        "Lcom/vladsch/flexmark/util/options/MutableDataSet;"
    }
.end annotation


# static fields
.field public static final EXTENSIONS:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Iterable<",
            "Lcom/vladsch/flexmark/util/builder/Extension;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final RELOAD_EXTENSIONS:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final UNLOAD_EXTENSIONS:Lcom/vladsch/flexmark/util/options/DataKey;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "Ljava/lang/Iterable<",
            "Lcom/vladsch/flexmark/util/builder/Extension;",
            ">;>;"
        }
    .end annotation
.end field


# instance fields
.field private currentExtension:Lcom/vladsch/flexmark/util/builder/Extension;

.field private final extensionApiPoints:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Class;",
            "Ljava/util/HashSet<",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field

.field private final loadedExtensions:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/Class;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 11
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "EXTENSIONS"

    sget-object v2, Lcom/vladsch/flexmark/util/builder/Extension;->EMPTY_LIST:Ljava/lang/Iterable;

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/util/builder/BuilderBase;->EXTENSIONS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 12
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const-string v1, "UNLOAD_EXTENSIONS"

    sget-object v2, Lcom/vladsch/flexmark/util/builder/Extension;->EMPTY_LIST:Ljava/lang/Iterable;

    invoke-direct {v0, v1, v2}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/util/builder/BuilderBase;->UNLOAD_EXTENSIONS:Lcom/vladsch/flexmark/util/options/DataKey;

    .line 13
    new-instance v0, Lcom/vladsch/flexmark/util/options/DataKey;

    const/4 v1, 0x1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    const-string v2, "RELOAD_EXTENSIONS"

    invoke-direct {v0, v2, v1}, Lcom/vladsch/flexmark/util/options/DataKey;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    sput-object v0, Lcom/vladsch/flexmark/util/builder/BuilderBase;->RELOAD_EXTENSIONS:Lcom/vladsch/flexmark/util/options/DataKey;

    return-void
.end method

.method protected constructor <init>()V
    .locals 1

    .line 143
    invoke-direct {p0}, Lcom/vladsch/flexmark/util/options/MutableDataSet;-><init>()V

    .line 16
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/util/builder/BuilderBase;->loadedExtensions:Ljava/util/HashSet;

    .line 19
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/util/builder/BuilderBase;->extensionApiPoints:Ljava/util/HashMap;

    return-void
.end method

.method protected constructor <init>(Lcom/vladsch/flexmark/util/builder/BuilderBase;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 147
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/options/MutableDataSet;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    .line 16
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/util/builder/BuilderBase;->loadedExtensions:Ljava/util/HashSet;

    .line 19
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/vladsch/flexmark/util/builder/BuilderBase;->extensionApiPoints:Ljava/util/HashMap;

    .line 149
    iget-object v0, p1, Lcom/vladsch/flexmark/util/builder/BuilderBase;->extensionApiPoints:Ljava/util/HashMap;

    .line 150
    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 151
    iget-object v2, p0, Lcom/vladsch/flexmark/util/builder/BuilderBase;->extensionApiPoints:Ljava/util/HashMap;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    new-instance v4, Ljava/util/HashSet;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Collection;

    invoke-direct {v4, v1}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 153
    :cond_0
    iget-object v0, p0, Lcom/vladsch/flexmark/util/builder/BuilderBase;->loadedExtensions:Ljava/util/HashSet;

    iget-object p1, p1, Lcom/vladsch/flexmark/util/builder/BuilderBase;->loadedExtensions:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->addAll(Ljava/util/Collection;)Z

    return-void
.end method

.method protected constructor <init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V
    .locals 0

    .line 133
    invoke-direct {p0, p1}, Lcom/vladsch/flexmark/util/options/MutableDataSet;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    .line 16
    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    iput-object p1, p0, Lcom/vladsch/flexmark/util/builder/BuilderBase;->loadedExtensions:Ljava/util/HashSet;

    .line 19
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/vladsch/flexmark/util/builder/BuilderBase;->extensionApiPoints:Ljava/util/HashMap;

    return-void
.end method


# virtual methods
.method protected addExtensionApiPoint(Ljava/lang/Object;)V
    .locals 3

    .line 78
    iget-object v0, p0, Lcom/vladsch/flexmark/util/builder/BuilderBase;->currentExtension:Lcom/vladsch/flexmark/util/builder/Extension;

    if-eqz v0, :cond_1

    .line 81
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 82
    iget-object v1, p0, Lcom/vladsch/flexmark/util/builder/BuilderBase;->extensionApiPoints:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/HashSet;

    if-nez v1, :cond_0

    .line 84
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 85
    iget-object v2, p0, Lcom/vladsch/flexmark/util/builder/BuilderBase;->extensionApiPoints:Ljava/util/HashMap;

    invoke-virtual {v2, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    :cond_0
    invoke-virtual {v1, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    :cond_1
    return-void
.end method

.method public final extensions(Ljava/lang/Iterable;)Lcom/vladsch/flexmark/util/builder/BuilderBase;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/vladsch/flexmark/util/builder/Extension;",
            ">;)TT;"
        }
    .end annotation

    .line 50
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vladsch/flexmark/util/builder/Extension;

    .line 51
    iput-object v1, p0, Lcom/vladsch/flexmark/util/builder/BuilderBase;->currentExtension:Lcom/vladsch/flexmark/util/builder/Extension;

    .line 52
    iget-object v3, p0, Lcom/vladsch/flexmark/util/builder/BuilderBase;->loadedExtensions:Ljava/util/HashSet;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 53
    invoke-virtual {p0, v1}, Lcom/vladsch/flexmark/util/builder/BuilderBase;->preloadExtension(Lcom/vladsch/flexmark/util/builder/Extension;)V

    .line 55
    :cond_0
    iput-object v2, p0, Lcom/vladsch/flexmark/util/builder/BuilderBase;->currentExtension:Lcom/vladsch/flexmark/util/builder/Extension;

    goto :goto_0

    .line 58
    :cond_1
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vladsch/flexmark/util/builder/Extension;

    .line 59
    iput-object v0, p0, Lcom/vladsch/flexmark/util/builder/BuilderBase;->currentExtension:Lcom/vladsch/flexmark/util/builder/Extension;

    .line 60
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    .line 61
    iget-object v3, p0, Lcom/vladsch/flexmark/util/builder/BuilderBase;->loadedExtensions:Ljava/util/HashSet;

    invoke-virtual {v3, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 62
    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/util/builder/BuilderBase;->loadExtension(Lcom/vladsch/flexmark/util/builder/Extension;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 63
    iget-object v0, p0, Lcom/vladsch/flexmark/util/builder/BuilderBase;->loadedExtensions:Ljava/util/HashSet;

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 66
    :cond_2
    iput-object v2, p0, Lcom/vladsch/flexmark/util/builder/BuilderBase;->currentExtension:Lcom/vladsch/flexmark/util/builder/Extension;

    goto :goto_1

    :cond_3
    return-object p0
.end method

.method protected abstract loadExtension(Lcom/vladsch/flexmark/util/builder/Extension;)Z
.end method

.method protected loadExtensions()V
    .locals 2

    .line 137
    sget-object v0, Lcom/vladsch/flexmark/util/builder/BuilderBase;->EXTENSIONS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/util/builder/BuilderBase;->contains(Lcom/vladsch/flexmark/util/options/DataKey;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 138
    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/util/builder/BuilderBase;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/util/builder/BuilderBase;->extensions(Ljava/lang/Iterable;)Lcom/vladsch/flexmark/util/builder/BuilderBase;

    :cond_0
    return-void
.end method

.method protected abstract preloadExtension(Lcom/vladsch/flexmark/util/builder/Extension;)V
.end method

.method protected abstract removeApiPoint(Ljava/lang/Object;)V
.end method

.method public bridge synthetic set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataHolder;
    .locals 0

    .line 10
    invoke-virtual {p0, p1, p2}, Lcom/vladsch/flexmark/util/builder/BuilderBase;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataSet;

    move-result-object p1

    return-object p1
.end method

.method public set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataSet;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/vladsch/flexmark/util/options/DataKey<",
            "+TT;>;TT;)",
            "Lcom/vladsch/flexmark/util/options/MutableDataSet;"
        }
    .end annotation

    .line 120
    invoke-virtual {p0, p1}, Lcom/vladsch/flexmark/util/builder/BuilderBase;->addExtensionApiPoint(Ljava/lang/Object;)V

    .line 121
    invoke-super {p0, p1, p2}, Lcom/vladsch/flexmark/util/options/MutableDataSet;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataSet;

    move-result-object p1

    return-object p1
.end method

.method public unloadExtension(Ljava/lang/Class;)V
    .locals 4

    if-eqz p1, :cond_2

    .line 93
    iget-object v0, p0, Lcom/vladsch/flexmark/util/builder/BuilderBase;->loadedExtensions:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 94
    iget-object v0, p0, Lcom/vladsch/flexmark/util/builder/BuilderBase;->extensionApiPoints:Ljava/util/HashMap;

    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/HashSet;

    if-eqz v0, :cond_1

    .line 97
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 98
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 99
    instance-of v3, v2, Lcom/vladsch/flexmark/util/options/DataKey;

    if-eqz v3, :cond_0

    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/builder/BuilderBase;->getAll()Ljava/util/Map;

    move-result-object v3

    invoke-interface {v3, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 100
    :cond_0
    invoke-virtual {p0, v2}, Lcom/vladsch/flexmark/util/builder/BuilderBase;->removeApiPoint(Ljava/lang/Object;)V

    .line 101
    :goto_1
    invoke-virtual {v0, v2}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    goto :goto_0

    .line 105
    :cond_1
    iget-object v0, p0, Lcom/vladsch/flexmark/util/builder/BuilderBase;->loadedExtensions:Ljava/util/HashSet;

    invoke-virtual {v0, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    :cond_2
    return-void
.end method

.method public unloadExtensions()V
    .locals 2

    .line 126
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/vladsch/flexmark/util/builder/BuilderBase;->loadedExtensions:Ljava/util/HashSet;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 127
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Class;

    .line 128
    invoke-virtual {p0, v1}, Lcom/vladsch/flexmark/util/builder/BuilderBase;->unloadExtension(Ljava/lang/Class;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method protected withOptions(Lcom/vladsch/flexmark/util/options/DataHolder;)V
    .locals 7

    .line 157
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 158
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    if-eqz p1, :cond_0

    .line 161
    sget-object v2, Lcom/vladsch/flexmark/util/builder/BuilderBase;->UNLOAD_EXTENSIONS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-interface {p1, v2}, Lcom/vladsch/flexmark/util/options/DataHolder;->contains(Lcom/vladsch/flexmark/util/options/DataKey;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 162
    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    .line 163
    invoke-virtual {v2, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Iterable;

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vladsch/flexmark/util/builder/Extension;

    .line 164
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    const/4 v3, 0x0

    .line 168
    :cond_1
    sget-object v2, Lcom/vladsch/flexmark/util/builder/BuilderBase;->EXTENSIONS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {p0, v2}, Lcom/vladsch/flexmark/util/builder/BuilderBase;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Iterable;

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_2
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vladsch/flexmark/util/builder/Extension;

    if-eqz v3, :cond_3

    .line 169
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2

    .line 170
    :cond_3
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 171
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_4
    if-eqz p1, :cond_9

    .line 176
    invoke-interface {p1}, Lcom/vladsch/flexmark/util/options/DataHolder;->keySet()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_5
    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_9

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vladsch/flexmark/util/options/DataKey;

    .line 177
    sget-object v5, Lcom/vladsch/flexmark/util/builder/BuilderBase;->EXTENSIONS:Lcom/vladsch/flexmark/util/options/DataKey;

    if-ne v4, v5, :cond_8

    .line 178
    invoke-interface {p1, v5}, Lcom/vladsch/flexmark/util/options/DataHolder;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Iterable;

    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_6
    :goto_3
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_5

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/vladsch/flexmark/util/builder/Extension;

    if-eqz v3, :cond_7

    .line 179
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_6

    .line 180
    :cond_7
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v1, v6}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_6

    .line 181
    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 186
    :cond_8
    invoke-interface {p1, v4}, Lcom/vladsch/flexmark/util/options/DataHolder;->get(Lcom/vladsch/flexmark/util/options/DataKey;)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {p0, v4, v5}, Lcom/vladsch/flexmark/util/builder/BuilderBase;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataSet;

    goto :goto_2

    :cond_9
    if-eqz p1, :cond_a

    .line 191
    sget-object v1, Lcom/vladsch/flexmark/util/builder/BuilderBase;->RELOAD_EXTENSIONS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-interface {p1, v1}, Lcom/vladsch/flexmark/util/options/DataHolder;->contains(Lcom/vladsch/flexmark/util/options/DataKey;)Z

    move-result v2

    if-eqz v2, :cond_a

    .line 192
    invoke-virtual {v1, p1}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_b

    .line 193
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/builder/BuilderBase;->unloadExtensions()V

    goto :goto_4

    .line 195
    :cond_a
    sget-object p1, Lcom/vladsch/flexmark/util/builder/BuilderBase;->RELOAD_EXTENSIONS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {p1, p0}, Lcom/vladsch/flexmark/util/options/DataKey;->getFrom(Lcom/vladsch/flexmark/util/options/DataHolder;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-eqz p1, :cond_b

    .line 196
    invoke-virtual {p0}, Lcom/vladsch/flexmark/util/builder/BuilderBase;->unloadExtensions()V

    .line 199
    :cond_b
    :goto_4
    sget-object p1, Lcom/vladsch/flexmark/util/builder/BuilderBase;->EXTENSIONS:Lcom/vladsch/flexmark/util/options/DataKey;

    invoke-virtual {p0, p1, v0}, Lcom/vladsch/flexmark/util/builder/BuilderBase;->set(Lcom/vladsch/flexmark/util/options/DataKey;Ljava/lang/Object;)Lcom/vladsch/flexmark/util/options/MutableDataSet;

    .line 200
    invoke-virtual {p0, v0}, Lcom/vladsch/flexmark/util/builder/BuilderBase;->extensions(Ljava/lang/Iterable;)Lcom/vladsch/flexmark/util/builder/BuilderBase;

    return-void
.end method
