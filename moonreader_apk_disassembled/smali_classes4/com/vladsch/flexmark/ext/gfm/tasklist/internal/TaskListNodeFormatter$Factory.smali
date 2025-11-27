.class public Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeFormatter$Factory;
.super Ljava/lang/Object;
.source "TaskListNodeFormatter.java"

# interfaces
.implements Lcom/vladsch/flexmark/formatter/NodeFormatterFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeFormatter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Factory"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 166
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public create(Lcom/vladsch/flexmark/util/options/DataHolder;)Lcom/vladsch/flexmark/formatter/NodeFormatter;
    .locals 1

    .line 169
    new-instance v0, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeFormatter;

    invoke-direct {v0, p1}, Lcom/vladsch/flexmark/ext/gfm/tasklist/internal/TaskListNodeFormatter;-><init>(Lcom/vladsch/flexmark/util/options/DataHolder;)V

    return-object v0
.end method
