.class public Lcom/dropbox/core/v2/files/SearchV2Arg$Builder;
.super Ljava/lang/Object;
.source "SearchV2Arg.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/dropbox/core/v2/files/SearchV2Arg;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field protected includeHighlights:Ljava/lang/Boolean;

.field protected matchFieldOptions:Lcom/dropbox/core/v2/files/SearchMatchFieldOptions;

.field protected options:Lcom/dropbox/core/v2/files/SearchOptions;

.field protected final query:Ljava/lang/String;


# direct methods
.method protected constructor <init>(Ljava/lang/String;)V
    .locals 2

    .line 145
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_1

    .line 149
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x3e8

    if-gt v0, v1, :cond_0

    .line 152
    iput-object p1, p0, Lcom/dropbox/core/v2/files/SearchV2Arg$Builder;->query:Ljava/lang/String;

    const/4 p1, 0x0

    .line 153
    iput-object p1, p0, Lcom/dropbox/core/v2/files/SearchV2Arg$Builder;->options:Lcom/dropbox/core/v2/files/SearchOptions;

    .line 154
    iput-object p1, p0, Lcom/dropbox/core/v2/files/SearchV2Arg$Builder;->matchFieldOptions:Lcom/dropbox/core/v2/files/SearchMatchFieldOptions;

    .line 155
    iput-object p1, p0, Lcom/dropbox/core/v2/files/SearchV2Arg$Builder;->includeHighlights:Ljava/lang/Boolean;

    return-void

    .line 150
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "String \'query\' is longer than 1000"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 147
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Required value for \'query\' is null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public build()Lcom/dropbox/core/v2/files/SearchV2Arg;
    .locals 5

    .line 202
    new-instance v0, Lcom/dropbox/core/v2/files/SearchV2Arg;

    iget-object v1, p0, Lcom/dropbox/core/v2/files/SearchV2Arg$Builder;->query:Ljava/lang/String;

    iget-object v2, p0, Lcom/dropbox/core/v2/files/SearchV2Arg$Builder;->options:Lcom/dropbox/core/v2/files/SearchOptions;

    iget-object v3, p0, Lcom/dropbox/core/v2/files/SearchV2Arg$Builder;->matchFieldOptions:Lcom/dropbox/core/v2/files/SearchMatchFieldOptions;

    iget-object v4, p0, Lcom/dropbox/core/v2/files/SearchV2Arg$Builder;->includeHighlights:Ljava/lang/Boolean;

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/dropbox/core/v2/files/SearchV2Arg;-><init>(Ljava/lang/String;Lcom/dropbox/core/v2/files/SearchOptions;Lcom/dropbox/core/v2/files/SearchMatchFieldOptions;Ljava/lang/Boolean;)V

    return-object v0
.end method

.method public withIncludeHighlights(Ljava/lang/Boolean;)Lcom/dropbox/core/v2/files/SearchV2Arg$Builder;
    .locals 0

    .line 191
    iput-object p1, p0, Lcom/dropbox/core/v2/files/SearchV2Arg$Builder;->includeHighlights:Ljava/lang/Boolean;

    return-object p0
.end method

.method public withMatchFieldOptions(Lcom/dropbox/core/v2/files/SearchMatchFieldOptions;)Lcom/dropbox/core/v2/files/SearchV2Arg$Builder;
    .locals 0

    .line 178
    iput-object p1, p0, Lcom/dropbox/core/v2/files/SearchV2Arg$Builder;->matchFieldOptions:Lcom/dropbox/core/v2/files/SearchMatchFieldOptions;

    return-object p0
.end method

.method public withOptions(Lcom/dropbox/core/v2/files/SearchOptions;)Lcom/dropbox/core/v2/files/SearchV2Arg$Builder;
    .locals 0

    .line 166
    iput-object p1, p0, Lcom/dropbox/core/v2/files/SearchV2Arg$Builder;->options:Lcom/dropbox/core/v2/files/SearchOptions;

    return-object p0
.end method
