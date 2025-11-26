.class public interface abstract Lcom/vladsch/flexmark/util/mappers/CharWidthProvider;
.super Ljava/lang/Object;
.source "CharWidthProvider.java"


# static fields
.field public static final NULL:Lcom/vladsch/flexmark/util/mappers/CharWidthProvider;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 8
    new-instance v0, Lcom/vladsch/flexmark/util/mappers/CharWidthProvider$1;

    invoke-direct {v0}, Lcom/vladsch/flexmark/util/mappers/CharWidthProvider$1;-><init>()V

    sput-object v0, Lcom/vladsch/flexmark/util/mappers/CharWidthProvider;->NULL:Lcom/vladsch/flexmark/util/mappers/CharWidthProvider;

    return-void
.end method


# virtual methods
.method public abstract charWidth(C)I
.end method

.method public abstract charWidth(Ljava/lang/CharSequence;)I
.end method

.method public abstract spaceWidth()I
.end method
