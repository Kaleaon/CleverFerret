.class public final Lio/opencensus/trace/Tracestate$Builder;
.super Ljava/lang/Object;
.source "Tracestate.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/opencensus/trace/Tracestate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# static fields
.field private static final EMPTY:Lio/opencensus/trace/Tracestate;


# instance fields
.field private entries:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lio/opencensus/trace/Tracestate$Entry;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final parent:Lio/opencensus/trace/Tracestate;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 109
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    invoke-static {v0}, Lio/opencensus/trace/Tracestate;->access$200(Ljava/util/List;)Lio/opencensus/trace/Tracestate;

    move-result-object v0

    sput-object v0, Lio/opencensus/trace/Tracestate$Builder;->EMPTY:Lio/opencensus/trace/Tracestate;

    return-void
.end method

.method private constructor <init>(Lio/opencensus/trace/Tracestate;)V
    .locals 1

    .line 111
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 112
    const-string v0, "parent"

    invoke-static {p1, v0}, Lio/opencensus/internal/Utils;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 113
    iput-object p1, p0, Lio/opencensus/trace/Tracestate$Builder;->parent:Lio/opencensus/trace/Tracestate;

    const/4 p1, 0x0

    .line 114
    iput-object p1, p0, Lio/opencensus/trace/Tracestate$Builder;->entries:Ljava/util/ArrayList;

    return-void
.end method

.method synthetic constructor <init>(Lio/opencensus/trace/Tracestate;Lio/opencensus/trace/Tracestate$1;)V
    .locals 0

    .line 103
    invoke-direct {p0, p1}, Lio/opencensus/trace/Tracestate$Builder;-><init>(Lio/opencensus/trace/Tracestate;)V

    return-void
.end method

.method static synthetic access$000()Lio/opencensus/trace/Tracestate;
    .locals 1

    .line 103
    sget-object v0, Lio/opencensus/trace/Tracestate$Builder;->EMPTY:Lio/opencensus/trace/Tracestate;

    return-object v0
.end method


# virtual methods
.method public build()Lio/opencensus/trace/Tracestate;
    .locals 1

    .line 178
    iget-object v0, p0, Lio/opencensus/trace/Tracestate$Builder;->entries:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 179
    iget-object v0, p0, Lio/opencensus/trace/Tracestate$Builder;->parent:Lio/opencensus/trace/Tracestate;

    return-object v0

    .line 181
    :cond_0
    invoke-static {v0}, Lio/opencensus/trace/Tracestate;->access$200(Ljava/util/List;)Lio/opencensus/trace/Tracestate;

    move-result-object v0

    return-object v0
.end method

.method public remove(Ljava/lang/String;)Lio/opencensus/trace/Tracestate$Builder;
    .locals 2

    .line 155
    const-string v0, "key"

    invoke-static {p1, v0}, Lio/opencensus/internal/Utils;->checkNotNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 156
    iget-object v0, p0, Lio/opencensus/trace/Tracestate$Builder;->entries:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 158
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lio/opencensus/trace/Tracestate$Builder;->parent:Lio/opencensus/trace/Tracestate;

    invoke-virtual {v1}, Lio/opencensus/trace/Tracestate;->getEntries()Ljava/util/List;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lio/opencensus/trace/Tracestate$Builder;->entries:Ljava/util/ArrayList;

    :cond_0
    const/4 v0, 0x0

    .line 160
    :goto_0
    iget-object v1, p0, Lio/opencensus/trace/Tracestate$Builder;->entries:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_2

    .line 161
    iget-object v1, p0, Lio/opencensus/trace/Tracestate$Builder;->entries:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/opencensus/trace/Tracestate$Entry;

    invoke-virtual {v1}, Lio/opencensus/trace/Tracestate$Entry;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 162
    iget-object p1, p0, Lio/opencensus/trace/Tracestate$Builder;->entries:Ljava/util/ArrayList;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    return-object p0

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    return-object p0
.end method

.method public set(Ljava/lang/String;Ljava/lang/String;)Lio/opencensus/trace/Tracestate$Builder;
    .locals 3

    .line 129
    invoke-static {p1, p2}, Lio/opencensus/trace/Tracestate$Entry;->create(Ljava/lang/String;Ljava/lang/String;)Lio/opencensus/trace/Tracestate$Entry;

    move-result-object p1

    .line 130
    iget-object p2, p0, Lio/opencensus/trace/Tracestate$Builder;->entries:Ljava/util/ArrayList;

    if-nez p2, :cond_0

    .line 132
    new-instance p2, Ljava/util/ArrayList;

    iget-object v0, p0, Lio/opencensus/trace/Tracestate$Builder;->parent:Lio/opencensus/trace/Tracestate;

    invoke-virtual {v0}, Lio/opencensus/trace/Tracestate;->getEntries()Ljava/util/List;

    move-result-object v0

    invoke-direct {p2, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object p2, p0, Lio/opencensus/trace/Tracestate$Builder;->entries:Ljava/util/ArrayList;

    :cond_0
    const/4 p2, 0x0

    const/4 v0, 0x0

    .line 134
    :goto_0
    iget-object v1, p0, Lio/opencensus/trace/Tracestate$Builder;->entries:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_2

    .line 135
    iget-object v1, p0, Lio/opencensus/trace/Tracestate$Builder;->entries:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lio/opencensus/trace/Tracestate$Entry;

    invoke-virtual {v1}, Lio/opencensus/trace/Tracestate$Entry;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lio/opencensus/trace/Tracestate$Entry;->getKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 136
    iget-object v1, p0, Lio/opencensus/trace/Tracestate$Builder;->entries:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    goto :goto_1

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 142
    :cond_2
    :goto_1
    iget-object v0, p0, Lio/opencensus/trace/Tracestate$Builder;->entries:Ljava/util/ArrayList;

    invoke-virtual {v0, p2, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    return-object p0
.end method
